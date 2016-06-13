# == Class: dovecot::service::managesieve_login
#
# This subclass configures the managesieve-login service
#
# === Parameters
#
# [*inet_listener*]
#   configure the inet_listener here, if you don't load this class,
#   but enable managesieve, dovecots default settings will be:
#   { 'sieve' => { 'port' => 4190 } }
#   so it only makes sense to use this class if you want diffrent settings.
#
#
# === Examples
#
#  class { 'dovecot':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
class dovecot::service::managesieve_login (
  $inet_listener,
  ) {
  
  validate_hash($inet_listener)

  $service = 'managesieve-login'

  file{"/etc/dovecot/conf.d/10-service-managesieve-login.conf":
    ensure  => present,
    content => template("${module_name}/10-service.conf.erb"),
  }

}
