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
directory "make_#{node['java']['setup']['app_dir']}" do
  path node['java']['setup']['app_dir']
  recursive true
end
directory "make_#{node['java']['setup']['app_dir']}/downloads" do
  path "#{node['java']['setup']['app_dir']}/downloads"
  recursive true
end

# download and install source
java_version = -> { node['java']['install_version'] }

# install
bash "install_#{java_version.call}" do
  code "rpm -Uv #{node['java']['setup']['app_dir']}/downloads/#{node['java']['oracle_rpm'][java_version.call]['url'].split('/')[-1]}"
  cwd "#{node['java']['setup']['app_dir']}/downloads"
  action :nothing
end

# download
bash "download_#{java_version.call}" do
  code "curl #{node['java']['setup']['dl_options']} \
          #{node['java']['oracle_rpm'][java_version.call]['url']} \
          -o #{node['java']['oracle_rpm'][java_version.call]['url'].split('/')[-1]}"
  cwd "#{node['java']['setup']['app_dir']}/downloads"
  action :run
  notifies :run, "bash[install_#{java_version.call}]", :immediately
  not_if { File.exist?("#{node['java']['setup']['app_dir']}/downloads/#{node['java']['oracle_rpm'][java_version.call]['url'].split('/')[-1]}") }
end
