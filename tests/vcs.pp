
class { 'veritas::vcs':
  systems =>  [
    { 'cluster-node-01' => { 
        'heartbeat_links' => [ 'eth3', 'eth7' ],
        'lopri_link'      => 'eth1',
      },
    },
    { 'cluster-node-02' => {
        'heartbeat_links' => ['eth3', 'eth7' ],
        'lopri_link'     => 'eth1',
      },
    }
  ],
  clustername => 'vcluster01',
  csgnetmask  => '255.255.254.0',
  csgnic      => 'eth1',
  csgvip      => '192.168.22.4',
  smtprecp    => 'craig@enviatics.com',
  smtpserver  => 'smtp.enviatics.com',
}

