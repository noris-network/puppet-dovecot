# == Class: dovecot::install
#
# This subclass handles installation of required dovecot packages
#
class dovecot::install {
  package{'dovecot-core':
    ensure => installed,
  }
  if ($::dovecot::protocols) {
    if member($::dovecot::protocols,'imap') {
      package{'dovecot-imapd':
        ensure => installed,
      }
    }
    if member($::dovecot::protocols,'lmtp') {
      package{'dovecot-lmtpd':
        ensure => installed,
      }
    }
    if member($::dovecot::protocols,'sieve') {
      package{['dovecot-managesieved','dovecot-sieve']:
        ensure => installed,
      }
    }
    if member($::dovecot::protocols,'pop3') {
      package{'dovecot-pop3d':
        ensure => installed,
      }
    }
  }
}
