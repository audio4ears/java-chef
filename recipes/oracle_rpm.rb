#
# Cookbook:: java-chef
# Recipe:: oracle_rpm
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# create application directories
directory "make_#{node['java']['oracle']['config']['app_dir']}" do
  path node['java']['oracle']['config']['app_dir']
  recursive true
end
directory "make_#{node['java']['oracle']['config']['app_dir']}/tmp" do
  path "#{node['java']['oracle']['config']['app_dir']}/tmp"
  recursive true
end


# download and install source
# install
bash "install_#{node['java']['install_version']}" do
  code "rpm -Uv #{node['java']['oracle']['config']['app_dir']}/tmp/#{node['java']['oracle']['url'].split('/')[-1]}"
  cwd "#{node['java']['oracle']['config']['app_dir']}/tmp"
  action :nothing
end
# download
bash "download_#{node['java']['install_version']}" do
  code "curl #{node['java']['oracle']['config']['dl_options']} \
          #{node['java']['oracle']['url']} \
          -o #{node['java']['oracle']['url'].split('/')[-1]}"
  cwd "#{node['java']['oracle']['config']['app_dir']}/tmp"
  action :run
  notifies :run, "bash[install_#{node['java']['install_version']}]", :immediately
  not_if  { File.exist?("#{node['java']['oracle']['config']['app_dir']}/tmp/#{node['java']['oracle']['url'].split('/')[-1]}") }
end
