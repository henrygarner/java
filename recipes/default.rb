#
# Author:: Henry Garner (<henry@henrygarner.com>)
# Cookbook Name:: java
# Attributes:: default 
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

remote_file "#{Chef::Config[:file_cache_path]}/oab-java.sh" do
  source "https://raw.github.com/flexiondotorg/oab-java6/2faf96772912aab2bbc3d4bf73e06983367fc832/oab-java.sh"
  checksum "d7ff6943a0e75ea33fd1b4e7a41b77eb05d09cb2"
  action :create_if_missing
  mode "0755"
end

execute "oab-java.sh" do
  cwd "/tmp"
  if node["java"]["jdk_version"] == "7"
    command "./oab-java.sh -7"
  else
    command "./oab-java.sh"
  end
  creates "/etc/apt/sources.list.d/oab.list"
end

if node["java"]["jdk_version"] == "7"
  package "oracle-java7-jdk"
else
  package "sun-java6-jdk"
end
