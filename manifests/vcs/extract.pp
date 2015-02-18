class veritas::vcs::extract (
  $source = '/root/VRTS_SF_HA_Solutions_6.2_RHEL.tar.gz',
  $dest   = '/root',
  $root   = 'dvd1-redhatlinux'
) { 

  # Download the file to $source
  
  # Extract the content
  exec { 'veritas::vcs::extract::tar':
    path    => '/usr/bin:/bin',
    cwd     => $dest,
    command => "tar -zxvf ${source}",
    creates => "${dest}/${root}",
  }

}

  
    
