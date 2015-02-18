class veritas::vcs::install (
  $answer_file = $::veritas::vcs::answer_file,
  $install_script = $::veritas::vcs::install_script
) {

  exec { 'veritas::vcs::install':
    command => "${install_script} -responsefile ${answer_file}",
    refreshonly => true,
    subscribe   => Package['VRTSsfcpi62'],
  }
  
}
