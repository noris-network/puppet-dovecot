# == Class: dovecot::protocol::lmtp
#
# This subclass configures the imap protocol
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
class dovecot::protocol::lmtp (
  $lmtp_save_to_detail_mailbox = undef,
  $mail_plugins                = [ '$mail_plugins' ]
  ) {
  
  if ($lmtp_save_to_detail_mailbox) { validate_bool($lmtp_save_to_detail_mailbox) }

  $protocol = 'lmtp'

  file{"/etc/dovecot/conf.d/20-protocol-lmtp.conf":
    ensure  => present,
    content => template("${module_name}/20-protocol.conf.erb"),
  }
}
