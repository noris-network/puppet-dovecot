# == Class: dovecot::protocol::imap
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
class dovecot::protocol::imap (
  $mail_max_userip_connections = undef,
  $mail_plugins                = [ '$mail_plugins' ]
  ) {
  
  if ($mail_max_userip_connections) { validate_integer($mail_max_userip_connections) }

  $protocol = 'imap'

  file{"/etc/dovecot/conf.d/20-protocol-imap.conf":
    ensure  => present,
    content => template("${module_name}/20-protocol.conf.erb"),
  }

}
