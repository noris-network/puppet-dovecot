# == Class: dovecot
#
# Full description of class dovecot here.
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
class dovecot (
  $disable_plaintext_auth        = $::dovecot::params::disable_plaintext_auth,
  $dotlock_use_excl              = $::dovecot::params::dotlock_use_excl,
  $verbose_proctitle             = $::dovecot::params::verbose_proctitle,
  $shutdown_clients              = $::dovecot::params::shutdown_clients,
  $mmap_disable                  = $::dovecot::params::mmap_disable,
  $mail_nfs_storage              = $::dovecot::params::mail_nfs_storage,
  $mail_nfs_index                = $::dovecot::params::mail_nfs_index,
  $mail_debug                    = $::dovecot::params::mail_debug,
  $mail_fsync                    = $::dovecot::params::mail_fsync,
  $protocols                     = $::dovecot::params::protocols,
  $managesieve_sieve_capability  = $::dovecot::params::managesieve_sieve_capability,
  $managesieve_notify_capability = $::dovecot::params::managesieve_notify_capability,
  $mail_plugins                  = $::dovecot::params::mail_plugins,
  $ssl_cert                      = $::dovecot::params::ssl_cert,
  $ssl_key                       = $::dovecot::params::ssl_key,
  ) inherits dovecot::params {

  if ($disable_plaintext_auth) { validate_bool($disable_plaintext_auth) }
  if ($dotlock_use_excl      ) { validate_bool($dotlock_use_excl      ) }
  if ($verbose_proctitle     ) { validate_bool($verbose_proctitle     ) }
  if ($shutdown_clients      ) { validate_bool($shutdown_clients      ) }
  if ($mmap_disable          ) { validate_bool($mmap_disable          ) }
  if ($mail_nfs_storage      ) { validate_bool($mail_nfs_storage      ) }
  if ($mail_nfs_index        ) { validate_bool($mail_nfs_index        ) }
  if ($mail_debug            ) { validate_bool($mail_debug            ) }

  if ($protocols)                     { validate_array($protocols                    ) }
  if ($managesieve_sieve_capability)  { validate_array($managesieve_sieve_capability ) }
  if ($managesieve_notify_capability) { validate_array($managesieve_notify_capability) }
  if ($mail_plugins)                  { validate_array($mail_plugins                 ) }

  include dovecot::install
  include dovecot::config
}
