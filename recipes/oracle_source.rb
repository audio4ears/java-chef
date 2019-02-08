#
# Cookbook:: java-chef
# Recipe:: oracle_source
#
# The MIT License
#
# Copyright (c) 2018 Ryan Hansohn
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# include package(s)
package ['unzip']

java_version = -> { node['java']['install_version'] }

# create application directories
directory "make_#{node['java']['setup']['app_dir']}/downloads" do
  path "#{node['java']['setup']['app_dir']}/downloads"
  recursive true
end

directory "make_#{node['java']['setup']['app_dir']}/#{node['java']['oracle_source'][java_version.call]['extract_dir']}" do
  path "#{node['java']['setup']['app_dir']}/#{node['java']['oracle_source'][java_version.call]['extract_dir']}"
  recursive true
end

# download and extract source
# extract
bash "extract_#{java_version.call}" do
  code "tar xvzf #{node['java']['oracle_source'][java_version.call]['url'].split('/')[-1]} \
          --strip-components=1 \
          -C #{node['java']['setup']['app_dir']}/#{node['java']['oracle_source'][java_version.call]['extract_dir']}"
  cwd "#{node['java']['setup']['app_dir']}/downloads"
  action :nothing
end
# download
bash "download_#{java_version.call}" do
  code "curl #{node['java']['setup']['dl_options']} \
          #{node['java']['oracle_source'][java_version.call]['url']} \
          -o #{node['java']['oracle_source'][java_version.call]['url'].split('/')[-1]}"
  cwd "#{node['java']['setup']['app_dir']}/downloads"
  action :run
  notifies :run, "bash[extract_#{java_version.call}]", :immediately
  not_if  { File.exist?("#{node['java']['setup']['app_dir']}/downloads/#{node['java']['oracle_source'][java_version.call]['url'].split('/')[-1]}") }
end

# create and run execute scripts
['postinstall.sh', 'verify.sh'].each do |script|
  # execute
  execute "run_#{node['java']['setup']['app_dir']}/downloads/#{script}" do
    command "#{node['java']['setup']['app_dir']}/downloads/#{script}"
    action :nothing
  end
  # create
  template "create_#{node['java']['setup']['app_dir']}/downloads/#{script}" do
    path "#{node['java']['setup']['app_dir']}/downloads/#{script}"
    source "#{script}.erb"
    mode 0755
    variables(
      'java_version' => java_version.call
    )
    action :create
    sensitive true
    notifies :run, "execute[run_#{node['java']['setup']['app_dir']}/downloads/#{script}]", :immediately
  end
end

# create symlinks
# directory symlinks
if defined?(node['java']['setup']['symlinks'])
  node['java']['setup']['symlinks'].each do |symlink|
    symlink_file = symlink.split('/')[-1]
    symlink_path = symlink.chomp(symlink_file)
    directory "make_#{symlink_path}" do
      path symlink_path
      recursive true
      not_if { File.exist?(symlink_path) }
    end
    link "symlink_#{java_version.call}_#{symlink}" do
      target_file symlink
      to "#{node['java']['setup']['app_dir']}/#{node['java']['oracle_source'][java_version.call]['extract_dir']}"
    end
  end
end

# binary symlink
link 'symlink_/bin/java' do
  target_file '/bin/java'
  to '/etc/alternatives/java'
end
