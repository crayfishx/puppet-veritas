# Class veritas::packages
#
# Here we define all the packages in the applucation suite - we define
# them as virtual so different products can realize different sets of 
# packages, we may not want to install everything.
#
#  
class veritas::packages {

  include ::veritas

  @package { [
    'VRTSperl',
    'VRTSvlic',
    'VRTSspt',
    'VRTSllt',
    'VRTSgab',
    'VRTSvxfen',
    'VRTSamf',
    'VRTSvcs',
    'VRTScps',
    'VRTSvcsag',
    'VRTSvcsdr',
    'VRTSvcsea',
    'VRTSsfmh',
    'VRTSvbs',
    'VRTSvcswiz',
    "VRTSsfcpi${::veritas::version_condensed}",
  ]:
    ensure => installed,
    tag    => [ 'vcs_cluster', 'veritas' ],
  }

}
