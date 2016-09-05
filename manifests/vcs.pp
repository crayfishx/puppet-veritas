# Class veritas::vcs
#
class veritas::vcs (
  $lltoverudp =      $::veritas::vcs::params::lltoverudp,
  $installrecpkgs =  $::veritas::vcs::params::installrecpkgs,
  $updatkeys =       $::veritas::vcs::params::updatekeys,
  $vxkeyless =       $::veritas::vcs::params::vxkeyless,
  $prod =            $::veritas::vcs::params::prod,
  $smtprsev =        $::veritas::vcs::params::smtprsev,
  $updatekeys =      $::veritas::vcs::params::updatekeys,
  $allowcomms =      $::veritas::vcs::params::allowcomms,
  $eat_security =    $::veritas::vcs::params::eat_security,
  $answer_file =     $::veritas::vcs::params::answer_file,
  $install_script =  $::veritas::vcs::params::install_script,
  $eat_security=     $::veritas::vcs::params::eat_security,
  $systems =         [],
  $heartbeat_links = [],
  $lopri_link =      '',
  $nodename =        $::hostname,
  $clusterid=        undef,
  $clustername,
  $csgnetmask=       '255.255.255.0',
  $csgnic,
  $csgvip,
  $smtprecp,
  $smtpserver,
  $eat_security_fips = undef,
  $gconetmask =      undef,
  $gconic =          undef,
  $gcovip =          undef,
  $securegco =       undef,
  $smtpserv =        undef,
  $snmpcons =        undef,
  $snmpcsev =        undef,
  $snmpport =        undef,
  $userenpw =        undef,
  $username =        undef,
  $userpriv =        undef,
) inherits veritas::vcs::params {

  include veritas

  if count($systems) > 0 {
    if (count($heartbeat_links) > 0) or $lopri_link {
      fail('Must use *one* of systems[] or heartbeat_links and lopri_link - see "mode" documentation')
      $target_systems=$systems
    }
 } else {
    if (count($heartbeat_links) < 1) or !$lopri_link {
      fail('If the systems[] parameter is not used then heartbeat_links[] and lopri_link *must* be set')
    }
    $target_systems = [ {
      "${nodename}" => {
        'heartbeat_links' => $heartbeat_links,
        'lopri_link' => $lopri_link
      }
    } ]
  }

  include veritas::packages
  file { $answer_file:
    ensure => file,
    content => template('veritas/vcs_responses.erb'),
  }

  Package <| title == 'VRTSperl' |> ->
  Package <| title == 'VRTSvlic' |> ->
  Package <| title == 'VRTSspt' |> ->
  Package <| title == 'VRTSllt' |> ->
  Package <| title == 'VRTSgab' |> ->
  Package <| title == 'VRTSvxfen' |> ->
  Package <| title == 'VRTSamf' |> ->
  Package <| title == 'VRTSvcs' |> ->
  Package <| title == 'VRTScps' |> ->
  Package <| title == 'VRTSvcsag' |> ->
#  Package <| title == 'VRTSvcsdr' |> ->
  Package <| title == 'VRTSvcsea' |> ->
  Package <| title == 'VRTSsfmh' |> ->
  Package <| title == 'VRTSvbs' |> ->
#  Package <| title == 'VRTSvcswiz' |> ->
  Package <| title == 'VRTSsfcpi62' |>->
  class { 'veritas::vcs::install': }->
  class { 'veritas::vcs::service': }

}

