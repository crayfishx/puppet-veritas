class veritas::vcs::service {

  service { 'llt': 
    ensure => running,
    enable => true,
    status => 'LC_ALL=C LANG=C /sbin/lltconfig | grep -v not >/dev/null 2>&1',
  }
  service { 'gab': 
    ensure => running,
    enable => true,
    status => 'LANG=C LC_ALL=C /sbin/gabconfig -l 2> /dev/null | grep "Driver state" | grep -q "Configured"',
    require => Service['llt'],
  }
  service { 'vcs': 
    ensure => running,
    enable => true,
    require => Service['gab'],
  }
}

