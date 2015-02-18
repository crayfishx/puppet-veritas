# Class veritas::packages
#
# Here we define all the packages in the applucation suite - we define
# them as virtual so different products can realize different sets of 
# packages, we may not want to install everything.
#
#  
class veritas::packages {
  @package { [
    'VRTSperl',
    'VRTSvlic',
    'VRTSllt',
    'VRTSgab',
    'VRTSvxfen',
    'VRTSamf',
    'VRTSvcs',
    'VRTSvcsag',
    'VRTSsfmh',
    'VRTSvcswiz',
  ]:
    ensure => installed,
    tag    => [ 'vcs_cluster', 'veritas' ],
    before => Package['VRTSsfcpi62'],
  }

  package { 'VRTSsfcpi62':
    ensure => 'installed',
    tag    => [ 'vcs_cluster', 'veritas' ],
  }

}


