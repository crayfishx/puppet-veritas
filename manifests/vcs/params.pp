class veritas::vcs::params {

  include veritas

  $lltoverudp='0'
  $installrecpkgs='1'
  $updatkeys='1'
  $vxkeyless='1'
  $prod="VCS${::veritas::version_condensed}"
  $allowcomms='1'
  $eat_security='1'
  $smtprsev='Error'
  $updatekeys=1
  $answer_file='/var/tmp/answers_veritas_vcs.txt'
  $install_script="/opt/VRTS/install/installvcs${::veritas::version_condensed}"
}




  
  
