#
# Cookbook:: java-chef
# Recipe:: oracle_package
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# install openjdk from repo
package 'install_oracle_package' do
  package_name node['java']['oracle']['package']
  version node['java']['oracle']['package_version']
end
