#
# Cookbook:: java-chef
# Recipe:: oracle_source
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# include package(s)
package ['unzip']

# create application directories
# directory "make_#{node['java']['oracle']['config']['app_dir']}" do
#   path node['java']['oracle']['config']['app_dir']
#   recursive true
# end
directory "make_#{node['java']['oracle']['config']['app_dir']}/tmp" do
  path "#{node['java']['oracle']['config']['app_dir']}/tmp"
  recursive true
end
directory "make_#{node['java']['oracle']['config']['app_dir']}/#{node['java']['oracle']['config']['extract_dir']}" do
  path "#{node['java']['oracle']['config']['app_dir']}/#{node['java']['oracle']['config']['extract_dir']}"
  recursive true
end

# download and extract source
# extract
bash "extract_#{node['java']['install_version']}" do
  code "tar xvzf #{node['java']['oracle']['url'].split('/')[-1]} \
          --strip-components=1 \
          -C #{node['java']['oracle']['config']['app_dir']}/#{node['java']['oracle']['config']['extract_dir']}"
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
  notifies :run, "bash[extract_#{node['java']['install_version']}]", :immediately
  not_if  { File.exist?("#{node['java']['oracle']['config']['app_dir']}/tmp/#{node['java']['oracle']['url'].split('/')[-1]}") }
end

# create and run execute scripts
['postinstall.sh', 'verify.sh'].each do |script|
  # execute
  execute "run_#{node['java']['oracle']['config']['app_dir']}/tmp/#{script}" do
    command "#{node['java']['oracle']['config']['app_dir']}/tmp/#{script}"
    action :nothing
  end
  # create
  template "create_#{node['java']['oracle']['config']['app_dir']}/tmp/#{script}" do
    path "#{node['java']['oracle']['config']['app_dir']}/tmp/#{script}"
    source "#{script}.erb"
    mode 0755
    action :create
    notifies :run, "execute[run_#{node['java']['oracle']['config']['app_dir']}/tmp/#{script}]", :immediately
  end
end

# create symlinks
# directory symlinks
if defined?(node['java']['oracle']['config']['symlinks']) &&
   !empty?(node['java']['oracle']['config']['symlinks'])
  node['java']['oracle']['config']['symlinks'].each do |symlink|
    symlink_file = symlink.split('/')[-1]
    symlink_path = symlink.chomp(symlink_file)
    directory "make_#{symlink_path}" do
      path symlink_path
      recursive true
      not_if { File.exist?(symlink_path) }
    end
    link "symlink_#{node['java']['install_version']}_#{symlink}" do
      target_file symlink
      to "#{node['java']['oracle']['config']['app_dir']}/#{node['java']['oracle']['config']['extract_dir']}"
    end
  end
end

# binary symlink
link 'symlink_/bin/java' do
  target_file '/bin/java'
  to '/etc/alternatives/java'
end
