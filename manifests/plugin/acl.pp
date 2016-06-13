# == Class: dovecot::plugin::acl
#
# This subclass configures dovecots acl plugin
#
# === Parameters
#
# Document parameters here.
#
# [*enable_imapd*]
#   
#
# === Examples
#
#  class { 'dovecot':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
class dovecot::plugin::acl (
  $acl = undef,
  ) {
  
  file{"/etc/dovecot/conf.d/90-acl.conf":
    ensure  => present,
    content => template("${module_name}/90-plugin.conf.erb"),
  }

}
