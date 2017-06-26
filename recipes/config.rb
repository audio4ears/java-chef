#
# Cookbook:: java-chef
# Recipe:: config
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# create java profile script
template "create_/etc/profile.d/java.sh" do
  path '/etc/profile.d/java.sh'
  source 'java.sh.erb'
  mode 0644
  action :create
end
