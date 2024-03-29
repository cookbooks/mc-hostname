#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2011, ModCloth, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
template "/etc/nodename" do
  source "nodename_solaris.erb"
  mode "0644"
end

template "/etc/hosts" do
  source "hosts_solaris.erb"
  mode "0644"
end

template "/etc/inet/ipnodes" do
  source "ipnodes_solaris.erb"
  mode "0644"
end

execute "set hostname to node name" do
  command "hostname #{node.name}"
  not_if "hostname | grep #{node.name}"
end