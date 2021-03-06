# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Reference: https://cloud.google.com/monitoring/agent/installation

# Download Stackdriver Monitoring agent
remote_file '/tmp/add-monitoring-agent-repo.sh' do
  source 'https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh'
  action :create
end

# Add the agent's package repository
execute 'bash /tmp/add-monitoring-agent-repo.sh'

execute 'Update Sources' do
  command 'apt-get update'
end

package 'Install Packages' do
  package_name ['stackdriver-agent']
  action :install
end
