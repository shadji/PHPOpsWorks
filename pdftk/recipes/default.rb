#
# Cookbook Name:: pdftk
# Recipe:: default
#
#



installed = File.exists?("/usr/local/bin/pdftk") && File.exists?("/usr/lib64/libgcj.so.10")

cookbook_file "/usr/local/bin/pdftk" do
  source "pdftk"
  mode 0755
  action :create
end
cookbook_file "/usr/lib64/libgcj.so.10" do
  source "libgcj.so.10"
  mode 0755
  action :create
end

