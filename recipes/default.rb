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

remote_file "/tmp/oab-java.sh" do
  source "https://raw.github.com/flexiondotorg/oab-java6/9250d866785a3e7a09a63740ab7fc8c2904e7ffd/oab-java.sh"
  checksum "63e6d8e0b1550498a9ace56640915614ea8ebc09"
  action :create_if_missing
  mode "0755"
end

execute "oab-java.sh" do
  cwd "/tmp"
  if node[:java][:jdk_version] == "7"
    command "./oab-java.sh -7"
  else
    command "./oab-java.sh"
  end
  creates "/etc/apt/sources.list.d/oab.list"
end

if node[:java][:jdk_version] == "7"
  package "oracle-java7-jdk"
else
  package "sun-java6-jdk"
end
