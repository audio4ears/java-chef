name 'java-chef'
maintainer 'Ryan Hansohn'
maintainer_email 'info@imnorobot.com'
license 'MIT'
description 'Installs/Configures java-chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
source_url 'https://github.com/hansohn/java-chef' if respond_to?(:source_url)
issues_url 'https://github.com/hansohn/java-chef/issues' if respond_to?(:issues_url)

supports 'centos', '>= 7.0'
