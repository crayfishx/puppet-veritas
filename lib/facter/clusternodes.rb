Facter.add(:hasyspath) do
  setcode do
    hasys_path = Facter::Core::Execution.exec('which hasys 2>/dev/null')
    if hasys_path == ""
      if File.exist? '/opt/VRTSvcs/bin/hasys'
        '/opt/VRTSvcs/bin/hasys'
      else
        false
      end
    else
      hasys_path
    end
  end
end

Facter.add(:vcs_clusternodes) do
  setcode do
    if Facter.value(:hasyspath)
      clusternodes = Facter::Util::Resolution.exec(Facter.value(:hasyspath) + ' -list')
      clusternodes
    else
      false
    end
  end
end

