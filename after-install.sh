#!/bin/bash

getent group bind >/dev/null 2>&1 || addgroup --system bind
getent passwd bind >/dev/null 2>&1 ||
    adduser --system --home /var/cache/bind --no-create-home \
           --disabled-password --ingroup bind bind

# We're assuming a chroot environment, so no populating/permissioning
# directories here.  It might look something like this (from Ubuntu postinst
# script):
#
#       chgrp bind /etc/bind
#       chmod g+s /etc/bind
#       chgrp bind /etc/bind/rndc.key /var/cache/bind
#       chgrp bind /etc/bind/named.conf* || true
#       chmod g+r /etc/bind/rndc.key /etc/bind/named.conf* || true
#       chmod g+rwx /var/cache/bind

# Activate init script:
update-rc.d bind9 defaults
