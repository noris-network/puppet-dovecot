# == Class: dovecot::service::imap
#
# This subclass configures the imap service
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
class dovecot::service::imap (
  $process_limit = undef,
  $vsz_limit     = undef,
  ) {
  
  if ($process_limit) { validate_integer($process_limit) }

  $service = 'imap'

  file{"/etc/dovecot/conf.d/10-service-imap.conf":
    ensure  => present,
    content => template("${module_name}/10-service.conf.erb"),
  }

}
