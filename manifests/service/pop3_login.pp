# == Class: dovecot::service::pop3_login
#
# This subclass configures the pop3-login service
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
class dovecot::service::pop3_login (
  $process_limit = undef,
  $client_limit  = undef,
  $service_count = undef,
  ) {
  
  if ($process_limit) { validate_integer($process_limit) }
  if ($client_limit)  { validate_integer($client_limit ) }
  if ($service_count) { validate_integer($service_count) }

  $service = 'pop3-login'

  file{"/etc/dovecot/conf.d/10-service-pop3-login.conf":
    ensure  => present,
    content => template("${module_name}/10-service.conf.erb"),
  }

}
