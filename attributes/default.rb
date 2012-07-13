default[:network_interfaces][:internal] = `ifconfig -a | grep -A 1 internal | tail -n 1 | awk '{print $2}'`

case node.platform
when "solaris2"
default[:zonename] = `zonename`
end