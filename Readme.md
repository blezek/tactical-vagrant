# TACTIC / Vagrant

[TACTIC](http://community.southpawtech.com/community/) is an open source web platform for building enterprise solutions.  TACTIC is best thought of as a digital asset management(DAM) system.

## Usage (TL;DR)
```bash
vagrant up
```

Start using your local TACTIC @ [http://localhost:3080](http://localhost:3080) with username "admin", password "tactic".

## Usage (Slightly more detailed)

Install [VirtualBox](https://www.virtualbox.org/) and the excellent [Vagrant](http://www.vagrantup.com/).

```bash
env BRANCH=4.2 vagrant up
```
Bring up a vagrant running the ```BRANCH``` version of the code.  There are several to [choose from](https://github.com/Southpaw-TACTIC/TACTIC/branches/all), or go with [active](https://github.com/Southpaw-TACTIC/TACTIC/branches/active) branches.  [YMMV](http://en.wiktionary.org/wiki/your_mileage_may_vary) for branches less than 4.0.

## Details
CentOS 6.5 running the [4.2 branch](https://github.com/Southpaw-TACTIC/TACTIC) of TACTIC. Built following the excellent [CentOS installation instructions](http://community.southpawtech.com/tactic-sys-admin_sys-admin_install-tactic-centos-6.2.html).  Secret sauce is in ```install-tactic.sh```.

## TACTIC Documentation
- [Getting started](http://community.southpawtech.com/tactic-content)
- [Tutorials](http://community.southpawtech.com/tactic-content/tutorials/all)
- [Tech Series of Videos](http://community.southpawtech.com/tactic-tech-series)
