node 'client' {
  include '::mysql::server'

    mysql::db { 'mydb':
    user => 'andrei_kutsko',
    password => 'password',
    ensure  => present,
    grant => ['ALL'],
  }
}
