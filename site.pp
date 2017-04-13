node 'node.loc' {
	class { '::mysql::server':
		root_password => 'strongpassword'
		}
	mysql_database { 'test_mdb':
		ensure => present,
		charset => 'utf8',
		}
	mysql_user { 'test_user@node.loc':
		ensure => present,
		}
	mysql_grant { 'test_user@node.loc/test_mdb.*':

		ensure => present,
		options => ['GRANT'],
		privileges => ['ALL'],
		table => 'test_mdb.*',
		user => 'test_user@node.loc',
		}
}
