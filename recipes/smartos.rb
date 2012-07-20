template "/etc/inet/hosts" do
  source "inet_hosts.erb"
  mode "0644"
  variables(
      :ipaddress => node[:ipaddress],
      :hostname => node.name
    )
end

template "/etc/nodename" do
  source "nodename.erb"
  mode "0644"
  variables(
      :hostname => node.name
    )
end

execute "set hostname to node name" do
  command "hostname #{node.name}"
  not_if {`hostname`.chomp.eql?(node.name)}
end
