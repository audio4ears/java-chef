#
# Cookbook:: java-chef
# Recipe:: oracle_rpm
#
# The MIT License (MIT)
#
# Copyright:: 2018, Ryan Hansohn
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
  not_if { File.exist?("#{node['java']['oracle']['config']['app_dir']}/tmp/#{node['java']['oracle']['url'].split('/')[-1]}") }
end
