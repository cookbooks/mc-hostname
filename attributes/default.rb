default[:network_interfaces][:internal] = `ifconfig -a | grep -A 1 internal | tail -n 1 | awk '{print $2}'`

case node.platform
when "solaris2"
  default[:zonename] = `zonename`
when "windows"
  name_parts = node.name.split(/\./)
  name_less_domain = name_parts[0..-3]
  default[:windows_hostname] = name_less_domain.join('-')
end
