# == Class: dovecot::protocol::pop3
#
# This subclass configures the pop3 protocol
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
class dovecot::protocol::pop3 (
  $mail_max_userip_connections = undef,
  $mail_plugins                = [ '$mail_plugins' ]
  ) {
  
  if ($mail_max_userip_connections) { validate_integer($mail_max_userip_connections) }

  $protocol = 'pop3'

  file{"/etc/dovecot/conf.d/20-protocol-pop3.conf":
    ensure  => present,
    content => template("${module_name}/20-protocol.conf.erb"),
  }

}
