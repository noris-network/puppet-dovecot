# == Class: dovecot::service::lmtp
#
# This subclass configures the lmtp service
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
class dovecot::service::lmtp (
  $process_limit = undef,
  $vsz_limit     = undef,
  ) {
  
  if ($process_limit) { validate_integer($process_limit) }

  $service = 'lmtp'

  file{"/etc/dovecot/conf.d/10-service-lmtp.conf":
    ensure  => present,
    content => template("${module_name}/10-service.conf.erb"),
  }

}
