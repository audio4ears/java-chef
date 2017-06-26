#
# Cookbook:: java-chef
# Recipe:: openjdk_package
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# install openjdk from repo
package "install_openjdk" do
  package_name node['java']['openjdk']['package'] 
  version node['java']['openjdk']['package_version']
end
