#
# Cookbook Name:: pdftk
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
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

pdftk_source = "pdftk-" + node.pdftk.version + "-src.zip"
pdftk_dir = "pdftk-" + node.pdftk.version + "-dist"
pdftk_url = node.pdftk.uri + "/" + pdftk_source

installed = File.exists?("/usr/local/bin/pdftk") && /^pdftk #{node.pdftk.version}/.match(`pdftk --version | head -n 2 | tail -n 1`.chomp)[0] != nil

case node["platform_family"]
when "rhel", "fedora"
  package "kernel-devel" do
    action :install
  end

  package "gcc-c++" do
    action :install
  end

  package "gcc-java" do
    action :install
  end
else
  package "build-essential" do
    action :install
  end

  package "g++" do
    action :install
  end

  package "gcj" do
    action :install
  end
end

package "unzip" do
  action :install
end

remote_file "/tmp/#{pdftk_source}" do
  source pdftk_url
  mode "0644"
  not_if { installed || File.exists?("/tmp/#{pdftk_source}") }
end

execute "Unzipping archive #{pdftk_source}" do
  command "cd /tmp; unzip #{pdftk_source}"
  not_if { installed || File.exists?("/tmp/#{pdftk_dir}") && File.directory?("/tmp/#{pdftk_dir}") }
end

case node['platform']
when "ubuntu","debian"
  execute "Building Software" do
    command "cd /tmp/#{pdftk_dir}/pdftk; make -f Makefile.Debian"
    not_if { installed || File.exists?("/tmp/#{pdftk_dir}/pdftk/pdftk") }
  end
  execute "Installing Software" do
    command "cd /tmp/#{pdftk_dir}/pdftk; sudo make -f Makefile.Debian install"
    not_if { installed || File.exists?("/usr/local/bin/pdftk") }
  end
when "centos","redhat","fedora"
  execute "Building Software" do
    command "cd /tmp/#{pdftk_dir}/pdftk; make -f Makefile.Redhat"
    not_if { installed || File.exists?("/tmp/#{pdftk_dir}/pdftk/pdftk") }
  end
  execute "Installing Software" do
    command "cd /tmp/#{pdftk_dir}/pdftk; sudo make -f Makefile.Redhat install"
    not_if { installed || File.exists?("/usr/local/bin/pdftk") }
  end
end

execute "Cleanup" do
  command "sudo rm -rf /tmp/#{pdftk_source} /tmp/#{pdftk_dir}"
  not_if { installed }
end