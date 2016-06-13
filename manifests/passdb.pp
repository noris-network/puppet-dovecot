# == Define: dovecot::passdb
#
# This define creates a passdb entry in dovecot
#
define dovecot::passdb (
 $args   = undef,
 $driver = undef,
){

  $type = 'passdb'

  file{"/etc/dovecot/conf.d/10-passdb-${title}.conf":
    ensure  => present,
    content => template("${module_name}/10-db.conf.erb"),
  }  
}
