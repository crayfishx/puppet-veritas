

class { 'veritas::vcs':
  heartbeat_links   => [ 'eth1', 'eth2' ],
  lopri_link        => 'eth0',
  clustername       => 'cluster1',
  csgnetmask        => '255.255.255.0',
  csgnic            => 'eth1',
  csgvip            => '192.168.33.4',
  smtprecp          => 'craig@enviatics.com',
  smtpserver        => 'smtp.enviatics.com',
}

