# == Class: dovecot::plugin::mail_log
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
class dovecot::plugin::mail_log (
  $mail_log_events = undef,
  $mail_log_fields = undef,
  ) {
  
  file{"/etc/dovecot/conf.d/90-mail_log.conf":
    ensure  => present,
    content => template("${module_name}/90-plugin.conf.erb"),
  }

}
