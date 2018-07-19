# java
default['java']['install_from'] = 'oracle_source'
default['java']['install_version'] = 'jdk-8u181-linux-x64'
case [node['java']['install_from'], node['java']['install_version']]
# oracle_package
when ['oracle_package', 'jdk-8u172-linux-x64']
  default['java']['oracle']['package'] = 'jdk-8u172-linux-x64'
  default['java']['oracle']['package_version'] = 'jdk1.8-1.8.0_172-fcs.x86_64'
# oracle_rpm
when ['oracle_rpm', 'jdk-8u102-linux-x64']
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm'
  default['java']['oracle']['checksum'] = '1214cad443522611173fa1252818dcea48f9bbeb8ea3bfce5e11eb0b696a968e'
when ['oracle_rpm', 'jdk-8u131-linux-x64']
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm'
  default['java']['oracle']['checksum'] = '3d1e8cc66f4fd77acef6093329d5dd95bd06e4a03926c52df794f311a0c093f8'
when ['oracle_rpm', 'jdk-8u172-linux-x64']
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm'
  default['java']['oracle']['checksum'] = '6a27b5718a5266cc725478d0b2e30fdc9bdb74b4e496971ed0f3b9c334d08163'
when ['oracle_rpm', 'jdk-8u181-linux-x64']
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm'
  default['java']['oracle']['checksum'] = '48af6afd56252f5e6641fd0ad9009c056ee5d178129b4824cef4b976a655d375'
# oracle_source
when ['oracle_source', 'jdk-8u102-linux-x64']
  default['java']['oracle']['config']['extract_dir'] = 'jdk1.8.0_102'
  default['java']['oracle']['config']['alt_priority'] = '18000102'
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz'
  default['java']['oracle']['checksum'] = '7cfbe0bc0391a4abe60b3e9eb2a541d2315b99b9cb3a24980e618a89229e04b7'
when ['oracle_source', 'jdk-8u131-linux-x64']
  default['java']['oracle']['config']['extract_dir'] = 'jdk1.8.0_131'
  default['java']['oracle']['config']['alt_priority'] = '18000131'
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz'
  default['java']['oracle']['checksum'] = 'a47dc0962a57b27a0cc00b9f11a53dc3add40c98633ba49a2419b845e4dedf43'
when ['oracle_source', 'jdk-8u172-linux-x64']
  default['java']['oracle']['config']['extract_dir'] = 'jdk1.8.0_172'
  default['java']['oracle']['config']['alt_priority'] = '18000172'
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz'
  default['java']['oracle']['checksum'] = '28a00b9400b6913563553e09e8024c286b506d8523334c93ddec6c9ec7e9d346'
when ['oracle_source', 'jdk-8u181-linux-x64']
  default['java']['oracle']['config']['extract_dir'] = 'jdk1.8.0_181'
  default['java']['oracle']['config']['alt_priority'] = '18000181'
  default['java']['oracle']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz'
  default['java']['oracle']['checksum'] = '1845567095bfbfebd42ed0d09397939796d05456290fb20a83c476ba09f991d3'
# openjdk
when ['openjdk_package', 'java-1.8.0-openjdk-devel']
  default['java']['openjdk']['package'] = 'java-1.8.0-openjdk-devel'
  default['java']['openjdk']['package_version'] = '1.8.0.171-8.b10.el7_5'
end
default['java']['oracle']['config']['app_dir'] = '/usr/java'
default['java']['oracle']['config']['dl_options'] = '-b oraclelicense=accept-securebackup-cookie -L -s'
default['java']['oracle']['config']['symlinks'] = ['/usr/lib/jvm/java']
