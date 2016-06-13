# == Class: dovecot::install
#
# This subclass handles all default parameters
#
class dovecot::params {
  $disable_plaintext_auth        = undef
  $dotlock_use_excl              = undef
  $verbose_proctitle             = undef
  $shutdown_clients              = undef
  $mmap_disable                  = undef
  $mail_nfs_storage              = undef
  $mail_nfs_index                = undef
  $mail_debug                    = undef
  $mail_fsync                    = undef
  $protocols                     = undef
  $managesieve_sieve_capability  = undef
  $managesieve_notify_capability = undef
  $ssl_cert                      = undef
  $ssl_key                       = undef
  $mail_plugins                  = undef
}
