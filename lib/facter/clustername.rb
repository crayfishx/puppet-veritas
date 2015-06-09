Facter.add(:hacluspath) do
  setcode do
    haclus_path = Facter::Core::Execution.exec('which haclus 2>/dev/null')
    if haclus_path == ""
      if File.exist? '/opt/VRTSvcs/bin/haclus'
        '/opt/VRTSvcs/bin/haclus'
      else
        false
      end
    else
      haclus_path
    end
  end
end

Facter.add(:vcs_clustername) do
  setcode do
    if Facter.value(:hacluspath)
      clustername = Facter::Util::Resolution.exec(Facter.value(:hacluspath) + ' -list')
      clustername
    else
      false
    end
  end
end
