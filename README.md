# How to automate updating of `*.deb` files in scattered locations

or: I don't want to check every Zoom update with my own eyes. Really.

1. `sudo ./setup.sh`
2. Done.

Now you can use `apt update` as usual, which will check on its own. Nothing special.

## ⚠ Warning ⚠

This repository is just a sample and not yet generalized enough. You'll need to edit files
yourself, especially `update-debs`.

Currently, it includes definitions of

* `zoom`
* `bat`
* `delta`

## Method

* You've created a local APT repository in `/usr/local/mydebs` directory
  * `setup.sh` is a simple copier with few lines
    * `/etc/apt/sources.list.d/mydebs.list`
    * `/etc/apt/apt.conf.d/99mydebs-update`
    * `/usr/local/mydebs/update-debs`
* The script `update-debs` is called whenever you invoke `apt update`
  * with `APT::Update::Pre-Invoke` hook in `99mydebs-update`
* `update-debs` checks updates of remote `*.deb` files, then download them into the local
  directory only when updated
  * with `wget -N` time-stamping option

So you don't need to watch webpages of companies and/or GitHub release pages anymore.

## References

This repository is just a recap/rehash of `niry`'s answer in askubuntu.com.

* https://askubuntu.com/a/1316231

I've been living by Debian for over 15 years, but I had no idea I could `apt update` from
local sources. Thanks a lot.

## TODO

* Generalize more: drive source definitions out of the script
* Be faster
* Secure with signatures
* Know about PPA
