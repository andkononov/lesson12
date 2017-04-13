node 'puppet-node.epbyminw2695.minsk.epam.com' {
 class { '::mysql::server':
  root_password    => 'root',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
 }

 mysql::db { 'test_mdb':
  user     => 'test_user',
  password => 'test_pass',
  host     => 'puppet-node.epbyminw2695.minsk.epam.com',
 } 
}

