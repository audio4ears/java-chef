# java
default['java'] = {
  'install_from' => 'oracle_source',
  'install_version' => 'jdk-8u201-linux-x64',
  'oracle_package' => {
    'jdk-8u172-linux-x64' => {
      'package' => 'jdk-8u172-linux-x64',
      'package_version' => 'jdk1.8-1.8.0_172-fcs.x86_64',
    },
    'jdk-8u201-linux-x64' => {
      'package' => 'jdk-8u201-linux-x64',
      'package_verion' => 'jdk1.8-1.8.0_201-fcs.x86_64',
    },
  },
  'oracle_rpm' => {
    'jdk-8u102-linux-x64' => {
      'url' => 'http//download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm',
      'checksum' => '1214cad443522611173fa1252818dcea48f9bbeb8ea3bfce5e11eb0b696a968e',
    },
    'jdk-8u131-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm',
      'checksum' => '3d1e8cc66f4fd77acef6093329d5dd95bd06e4a03926c52df794f311a0c093f8',
    },
    'jdk-8u172-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm',
      'checksum' => '6a27b5718a5266cc725478d0b2e30fdc9bdb74b4e496971ed0f3b9c334d08163',
    },
    'jdk-8u181-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm',
      'checksum' => '48af6afd56252f5e6641fd0ad9009c056ee5d178129b4824cef4b976a655d375',
    },
    'jdk-8u201-linux-x64' => {
      'url' => 'https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm',
      'checksum' => 'fea8044667169dbd843a4c7bd447d46ce0462ff9d87989f1ad36fba81fb79ffa',
    },
  },
  'oracle_source' => {
    'jdk-8u102-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_102',
      'alt_priority' => '18000102',
      'url' => 'http://download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz',
      'checksum' => '7cfbe0bc0391a4abe60b3e9eb2a541d2315b99b9cb3a24980e618a89229e04b7',
    },
    'jdk-8u131-linux-x64' => {
      'extract_dir' => 'extract_dir',
      'alt_priority' => '18000131',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz',
      'checksum' => 'a47dc0962a57b27a0cc00b9f11a53dc3add40c98633ba49a2419b845e4dedf43',
    },
    'jdk-8u172-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_172',
      'alt_priority' => '18000172',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz',
      'checksum' => '28a00b9400b6913563553e09e8024c286b506d8523334c93ddec6c9ec7e9d346',
    },
    'jdk-8u181-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_181',
      'alt_priority' => '18000181',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz',
      'checksum' => '1845567095bfbfebd42ed0d09397939796d05456290fb20a83c476ba09f991d3',
    },
    'jdk-8u201-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_201',
      'alt_priority' => '18000201',
      'url' => 'https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz',
      'checksum' => 'cb700cc0ac3ddc728a567c350881ce7e25118eaf7ca97ca9705d4580c506e370',
    },
  },
  'openjdk_package' => {
    'java-1.8.0-openjdk-devel' => {
      'package' => 'java-1.8.0-openjdk-devel',
      'package_version' => '1.8.0.171-8.b10.el7_5',
    },
  },
  'setup' => {
    'dl_options' => '-b oraclelicense=accept-securebackup-cookie -L -s',
    'app_dir' => '/usr/java',
    'symlinks' => [
      '/usr/lib/jvm/java',
    ],
  },
}
