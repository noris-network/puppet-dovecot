# == Define: dovecot::namespace
#
# This define create a namespace in dovecot
#
define dovecot::namespace (
 $list      = undef,
 $location  = undef,
 $prefix    = undef,
 $separator = undef,
 $inbox     = undef,
 $hidden    = undef,
){

  if ($list)   { validate_bool($list  ) }
  if ($inbox)  { validate_bool($inbox ) }
  if ($hidden) { validate_bool($hidden) }

  file{"/etc/dovecot/conf.d/15-namespace-${title}.conf":
    ensure  => present,
    content => template("${module_name}/15-namespace.conf.erb"),
  }  
}
