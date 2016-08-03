# == Class: dovecot::config
#
# This subclass handles configuration of dovecot config files
#
class dovecot::config {

  $managesieve_sieve_capability = $dovecot::managesieve_sieve_capability
  $ssl_key                      = $dovecot::ssl_key
  $ssl_cert                     = $dovecot::ssl_cert
  $protocols                    = $dovecot::protocols
  $mail_plugins                 = $dovecot::mail_plugins
  $mail_fsync                   = $dovecot::mail_fsync
  $verbose_proctitle            = $dovecot::verbose_proctitle
  $shutdown_clients             = $dovecot::shutdown_clients
  $mmap_disable                 = $dovecot::mmap_disable
  $mail_nfs_storage             = $dovecot::mail_nfs_storage
  $mail_nfs_index               = $dovecot::mail_nfs_index
  $mail_debug                   = $dovecot::mail_debug
  $dotlock_use_excl             = $dovecot::dotlock_use_excl
  $disable_plaintext_auth       = $dovecot::disable_plaintext_auth

  file { '/etc/dovecot/conf.d':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }
  file{'/etc/dovecot/dovecot.conf':
    ensure => present,
    source => "puppet:///modules/${module_name}/dovecot.conf",
  }
  file{'/etc/dovecot/conf.d/10-master.conf':
    ensure  => present,
    content => template("${module_name}/10-master.conf.erb"),
  }
  if ($::dovecot::ssl_cert or $::dovecot::ssl_key) {
    file{'/etc/dovecot/conf.d/10-ssl.conf':
      ensure  => present,
      content => template("${module_name}/10-ssl.conf.erb"),
    }
  }
  if ($::dovecot::managesieve_sieve_capability) {
    file{'/etc/dovecot/conf.d/10-sieve.conf':
      ensure  => present,
      content => template("${module_name}/10-sieve.conf.erb"),
    }
  }

}
