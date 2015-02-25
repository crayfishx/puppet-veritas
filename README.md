# puppet-veritas

This module manages the installation and initial configuration of Veritas products.  Curently only VCS (Veritas Cluster Server) is supported, but the goal is to use the same framework to install other applications from the same application suite.


## VCS

### Pre-installation requirements ###

VCS is shipped as a tarball containing RPM packages and an installer tool.  There is also a supported method of installing the relevant RPM's from YUM and using the provided configuration tool and a resposne file to finish installation and configure the system.  This module assumed you have already copied the RPM's from the tarball into their own YUM repository. In order to do this, follow steps 1 through 3 of the guide; [Installing Veritas Cluster Server using yum](https://sort.symantec.com/public/documents/vcs/6.0/linux/productguides/html/vcs_install/ch16s05.htm) (Adding an RPM group is optional and does not affect this module).  You should not install the modules.

### Pre-requisiste packages ###

A number of system packages are required, these should be installed before running this module

Redhat 6.6
* glibc-2.12-1.149.el6.i686
* glibc-2.12-1.149.el6.x86_64   
* ksh-20120801-21.el6.x86_64    
* libgcc-4.4.7-11.el6.i686      
* libgcc-4.4.7-11.el6.x86_64
* libstdc++-4.4.7-11.el6.i686   
* libstdc++-4.4.7-11.el6.x86_64 
* perl-5.10.1-136.el6.x86_64

Note, for package requirements of other distros you can run _installvcs -requirements_ from the tarball.

### Single or multiple installation mode ###

VCS has the ability to perform installations simultaneously on multiple nodes.  This feature requires the ability to ssh between the hosts in the cluster using a root SSH key.  Alternativly the software can be installed independantly on each cluster node.  This module supports both methods of operation.  If you have root SSH key communication between the cluster nodes, then you can define the systems in the cluster using the `system[]` parameter and run puppet on one of the cluster nodes to configure all of them.  Alternativly you can run Puppet on each node in the cluster with the `heartbeat_links[]` and `lopri_link` parameters defined.  See the following examples:

#### With SSH keys, running Puppet once ####

```puppet
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
```

#### Without SSH keys, running Puppet on each node

```puppet
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
```

In this example, the name of the node will be taken from `$::hostname`, to override this you can pass in the `nodename` parameter.







###

* Written and maintained by Craig Dunn <craig@craigdunn.org> - @crayfishx
* Sponsered by Baloise Group [http://baloise.github.io](http://baloise.github.io) 

