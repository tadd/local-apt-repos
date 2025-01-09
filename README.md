> [!WARNING]
> **This repository was generalized and deprecated in favor of
> [local-apt-repository-update-debs](https://github.com/tadd/local-apt-repository-update-debs)
> with [local-apt-repository](https://salsa.debian.org/debian/local-apt-repository).**

# How to automate updating of `*.deb` files in scattered locations

or: I don't want to check every Zoom update with my own eyes. Really.

1. `sudo ./setup.sh`
2. Done.

Now you can use `apt update` as usual, which will check on its own. Nothing special.

## ⚠ Warning ⚠

This repository is just a sample and not yet generalized enough. You'll need to edit files
yourself, especially `update-index`.

Currently, it includes definitions of

* [`zoom`](https://zoom.us/download?os=linux)
* [`bat`](https://github.com/sharkdp/bat)
* [`delta`](https://github.com/dandavison/delta) (or `git-delta` as a package)
* [`discord`](https://discord.com/download)
* [`rclone`](https://github.com/rclone/rclone)

## Method

* You've created a local APT repository in `/usr/local/mydebs` directory
  * `setup.sh` is a simple copier with few lines
    * `/etc/apt/sources.list.d/mydebs.list`
    * `/etc/apt/apt.conf.d/99mydebs-update`
    * `/usr/local/mydebs/update-index`
* The script `update-index` is called whenever you invoke `apt update`
  * with `APT::Update::Pre-Invoke` hook in `99mydebs-update`
* It checks remote `*.deb` files and downloads them **only if updated**
  * with `wget -N` timestamp-checking option
* Then builds two files to behave as a local repository
  * `Packages` and `Release` with `apt-ftparchive` command (It's useful even without FTP)

So you don't need to watch webpages of companies and/or GitHub release pages anymore if
you setup once.

## References

This repository is just a recap/rehash of `niry`'s answer in
[askubuntu.com](https://askubuntu.com):
**[Updating Zoom in the terminal](https://askubuntu.com/a/1316231)**.

I've been living by Debian for over 15 years, but I had no idea I could `apt update` from
local sources. Thanks a lot.

## TODO

* Generalize more: drive source definitions out of the script
* Be faster
* Secure with signatures
* ~~Know about PPA~~
