node 'puppet_agent1' {
  include '::mysql::server'

  mysql::db { 'test_mdb':
    user     => 'test_user',
    password => 'p@$$w0rd',
    grant    => ['ALL'],
  }

}

