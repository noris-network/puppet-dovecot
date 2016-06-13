# == Define: dovecot::userdb
#
# This define creates a userdb entry in dovecot
#
define dovecot::userdb (
 $args   = undef,
 $driver = undef,
){
  
  $type = 'userdb'

  file{"/etc/dovecot/conf.d/10-userdb-${title}.conf":
    ensure  => present,
    content => template("${module_name}/10-db.conf.erb"),
  }  
}
