# == Class: avahi
#
#  This module sets up avahi on EL based systems.
#
#
#  Requirements:
#    cprice404-inifile >= 0.0.3
#
# === Parameters
#
# === Examples
#
#  class { avahi:  }
#
# === Authors
#
# Michael Stahnke <stahnma@fedoraproject.org>
#
# === Copyright
#
# Copyright 2012 Michael Stahnke


class avahi {

    $avahi_pkgs = [ 'avahi', 'avahi-tools', 'nss-mdns' ]

   package { $avahi_pkgs:
     ensure  => installed,
   }

   service { 'avahi-daemon':
     ensure    => running,
     enable    => true,
     hasstatus => true,
     require   => Service['messagebus'],
   }

   service { 'messagebus':
     ensure  => running,
     enable  => true,
     require => Package[$avahi_pkgs],
   }

  ini_setting { "avahi-${::hostname}":
    ensure  => present,
    path    => '/etc/avahi/avahi-daemon.conf',
    section => 'server',
    setting => 'host-name',
    key_val_separator => '=',
    value   => $::hostname,
    notify  => Service['avahi-daemon'],
  }

}
