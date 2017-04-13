node vm7.mnt.com {
  class {'::mysql::server':
    root_password    => 'rootroot',
  }
  mysql_database {'test_mdb':
    ensure  => present,
    charset => 'utf8',
  }
  mysql_user { 'test_user@localhost':
    ensure => present,
    password_hash => mysql_password('testtest'),
 }
  mysql_grant {'test_user@localhost/test_mdb.*':
    ensure     => present,
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => 'test_mdb.*',
    user       => 'test_user@localhost',
  }
}
