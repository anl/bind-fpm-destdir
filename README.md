# README

## Prereqs

* [fpm](https://github.com/jordansissel/fpm/); I like to do this with an rbenv
Ruby.
* Tools to build [ISC BIND](https://www.isc.org/software/bind)

## Instructions

* Clone this repository:

`$ git clone git://github.com/anl/bind-fpm-destdir.git ~/bind-fpm-destdir-9.9.2-1`

* [Download](https://www.isc.org/software/bind), configure and build BIND.
* Install BIND into the cloned repo:

`$ make install DESTDIR=~/bind-fpm-destdir-9.9.2-1`


* Package using fpm:

```$ fpm -s dir -t deb -n bind -v 9.9.2-1 -C ~/bind-fpm-destdir-9.9.2-1
> -p bind-VERSION_ARCH.deb
> --after-install ~/bind-fpm-destdir-9.9.2-1/after-install.sh
> etc usr
```
