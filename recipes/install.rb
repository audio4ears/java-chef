#
# Cookbook:: java-chef
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install java
case node['java']['install_from']
when 'openjdk_package'
  include_recipe "#{cookbook_name}::openjdk_package"
when 'oracle_package'
  include_recipe "#{cookbook_name}::oracle_package"
when 'oracle_rpm'
  include_recipe "#{cookbook_name}::oracle_rpm"
when 'oracle_source'
  include_recipe "#{cookbook_name}::oracle_source"
end
include_recipe "#{cookbook_name}::config"
