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
case node[:platform]
when "debian","ubuntu"
  include_recipe "hostname::debian"
when "solaris2"
  include_recipe "hostname::solaris"
when "smartos"
  include_recipe "hostname::smartos"
when "winows"
  include_recipe "hostname::windows"
else
  Chef::Log.error("The 'hostname' cookbook is not supported on this platform.")
end
