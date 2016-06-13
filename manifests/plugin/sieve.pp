# == Class: dovecot::plugin::sieve
#
# This subclass configures dovecots sieve plugin
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
class dovecot::plugin::sieve (
  $recipient_delimiter = undef,
  $sieve               = undef,
  $sieve_dir           = undef,
  $sieve_extensions    = undef,
  $sieve_max_redirects = undef,
  ) {

  if ($sieve_max_redirects) { validate_integer($sieve_max_redirects) }
  if ($sieve_extensions)    { validate_array($sieve_extensions)  }
  
  file{"/etc/dovecot/conf.d/90-sieve.conf":
    ensure  => present,
    content => template("${module_name}/90-plugin.conf.erb"),
  }

}
