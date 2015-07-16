class grub::config inherits grub::params {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '5','6': {
          augeas { 'grub.conf/password':
            incl   => '/boot/grub/grub.conf',
            lens   => 'grub.lns',
            changes => [
              "ins password after hiddenmenu",
              "clear password/encrypted",
              "set password $grub::params::md5_hash"
            ],
            onlyif  => "match password size == 0";
          }
        }
        '7': {
          file { '01_users':
            path   => '/etc/grub.d/01_users',
            ensure => 'file',
            owner  => 'root',
            group  => 'root',
            mode   => '0755',
            content => template('grub/01_users.erb')
          }
          exec { 'grub2-mkconfig':
            path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin',
            command => 'grub2-mkconfig -o /boot/grub2/grub.cfg',
            subscribe => File['/etc/grub.d/01_users'],
            refreshonly => 'true',
          }
            
        }
      }
    }
  }
}
