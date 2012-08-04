class avahi::params {

  if $::osfamily == 'RedHat' {
    $avahi_main    = 'avahi'
    $avahi_daemon  = 'avahi-daemon'
    $avahi_tools   = 'avahi-tools'
    $avahi_mdns    = 'nss-mdns'
    $avahi_dbus    = 'messagebus'
  }
  elsif $::osfamily == 'Debian' {
    $avahi_main    = 'libavahi-common3'
    $avahi_daemon  = 'avahi-daemon'
    $avahi_tools   = 'avahi-utils'
    $avahi_mdns    = 'libnss-mdns'
    $avahi_dbus    = 'dbus'
  }

}
