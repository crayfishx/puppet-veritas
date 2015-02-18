

class { 'veritas::vcs':
  heartbeat_links   => [ 'eth3', 'eth7' ],
  lopri_link        => 'eth1'
  clustername       => 'cluster1',
  csgnetmask        => '255.255.254.0',
  csgnic            => 'eth1',
  csgvip            => '192.168.33.4',
  smtprecp          => 'craig@enviatics.com',
  smtpserver        => 'smtp.enviatics.com',
}

