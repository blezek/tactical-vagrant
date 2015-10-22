#!/bin/sh

branch=$1
echo "installing TACTIC ($branch)"
echo "installing python"
yum install -y python python-lxml python-devel

echo "installing other dependancies"

yum install -y ImageMagick wget
yum install -y emacs-nox

yum install -y httpd
yum install -y git

rpm -Uvh http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
yum install -y postgresql92 postgresql92-server postgresql92-contrib postgresql92-devel python-psycopg2

echo "install PIL"
wget http://effbot.org/downloads/Imaging-1.1.7.tar.gz
tar -zxvf Imaging-1.1.7.tar.gz
cd Imaging-1.1.7
python setup.py install
cd

echo "install pycrypto"
wget http://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.3.tar.gz
tar -zxvf pycrypto-2.3.tar.gz
cd pycrypto-2.3
python setup.py install
cd

echo "checking out TACTIC"
if [ ! -e TACTIC ]; then
  git clone https://github.com/Southpaw-TACTIC/TACTIC.git
fi
(cd TACTIC && git checkout $branch)



echo "creating DB"
service postgresql-9.2 initdb
mv /var/lib/pgsql/9.2/data/pg_hba.conf /var/lib/pgsql/9.2/data/pg_hba.conf.INSTALL
cp TACTIC/src/install/postgresql/pg_hba.conf /var/lib/pgsql/9.2/data/pg_hba.conf
chown postgres:postgres /var/lib/pgsql/9.2/data/pg_hba.conf
service postgresql-9.2 start

echo "starting http"
service httpd start
# TACTIC requires the apache account to have a real shell
usermod --shell /bin/bash apache

cd TACTIC
yes | python src/install/install.py -d -i True


echo "configuring Apache"
cp /home/apache/tactic_data/config/tactic.conf /etc/httpd/conf.d
cat >> /var/www/html/index.html << EOF
<META http-equiv="refresh" content="0;URL=/tactic">
EOF

chmod 644 /var/www/html/index.html
service httpd restart

echo "starting TACTIC"
cp /home/apache/tactic/src/install/service/tactic /etc/init.d/tactic
chmod 755 /etc/init.d/tactic
/etc/init.d/tactic start


echo "configuring services to restart"
/sbin/chkconfig tactic on
/sbin/chkconfig httpd on
/sbin/chkconfig postgresql-9.2 on
