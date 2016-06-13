# == Class: dovecot::plugin::lazy_expunge
#
# This subclass configures dovecots mail_log plugin
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
class dovecot::plugin::lazy_expunge (
  $lazy_expunge = undef,
  ) {
  
  file{"/etc/dovecot/conf.d/90-lazy_expunge.conf":
    ensure  => present,
    content => template("${module_name}/90-plugin.conf.erb"),
  }

}
