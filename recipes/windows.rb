#
# Cookbook Name:: hostname
# Recipe:: windows
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

# XXX Requires you to explicitly include `recipe[powershell::default]`
# XXX elsewhere in your run_list
powershell "set hostname" do
  code <<-EOH
  $new_name = '#{node['windows_hostname']}'
  $sys_info = Get-WmiObject -Class Win32_ComputerSystem
  $sys_info.Rename($new_name)
  EOH
end
