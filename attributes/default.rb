# java
default['java'] = {
  'install_from' => 'amazon_source',
  'install_version' => 'jdk-8u232-linux-x64',
  'adoptopenjdk_source' => {
    'jdk-8u232-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_232',
      'alt_priority' => '18000232',
      'url' => 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz',
      'checksum' => '7b7884f2eb2ba2d47f4c0bf3bb1a2a95b73a3a7734bd47ebf9798483a7bcc423',
    },
  },
  'amazon_rpm' => {
    'jdk-8u212-linux-x64' => {
      'url' => 'https://d3pxv6yz143wms.cloudfront.net/8.212.04.2/java-1.8.0-amazon-corretto-devel-1.8.0_212.b04-2.x86_64.rpm',
      'checksum' => 'f137ea8cd0b0041add85b461cc0ea62fdc939360034308c4e20d3184faf9f2ed',
    },
    'jdk-8u232-linux-x64' => {
      'url' => 'https://d3pxv6yz143wms.cloudfront.net/8.232.09.1/java-1.8.0-amazon-corretto-devel-1.8.0_232.b09-1.x86_64.rpm',
      'checksum' => 'e33fb508894e9728cea20d9da375e3ea57f6a05a6e1dfef4aa39e0528600d894',
    },
  },
  'amazon_source' => {
    'jdk-8u212-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_212',
      'alt_priority' => '18000212',
      'url' => 'https://d3pxv6yz143wms.cloudfront.net/8.212.04.2/amazon-corretto-8.212.04.2-linux-x64.tar.gz',
      'checksum' => '84241d523798c1df5b7c5e2e57615a8761b6eb8386eb87026895803319d3c5ce',
    },
    'jdk-8u232-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_232',
      'alt_priority' => '18000232',
      'url' => 'https://d3pxv6yz143wms.cloudfront.net/8.232.09.1/amazon-corretto-8.232.09.1-linux-x64.tar.gz',
      'checksum' => 'df70a9b988bd95b85326c56cb6d9cc57c0ef8b41d002ebaad55380b97e5623e8',
    },
  },
  'openjdk_package' => {
    'java-1.8.0-openjdk-devel' => {
      'package' => 'java-1.8.0-openjdk-devel',
      'package_version' => '1.8.0.232.b09-1',
    },
  },
  'oracle_package' => {
    'jdk-8u172-linux-x64' => {
      'package' => 'jdk-8u172-linux-x64',
      'package_version' => 'jdk1.8-1.8.0_172-fcs.x86_64',
    },
    'jdk-8u201-linux-x64' => {
      'package' => 'jdk-8u201-linux-x64',
      'package_verion' => 'jdk1.8-1.8.0_201-fcs.x86_64',
    },
    'jdk-8u212-linux-x64' => {
      'package' => 'jdk-8u212-linux-x64',
      'package_verion' => 'jdk1.8-1.8.0_212-fcs.x86_64',
    },
    'jdk-8u232-linux-x64' => {
      'package' => '',
      'package_verion' => '',
    },
  },
  'oracle_rpm' => {
    'jdk-8u102-linux-x64' => {
      'url' => 'http//download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm',
    },
    'jdk-8u131-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm',
    },
    'jdk-8u172-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm',
    },
    'jdk-8u181-linux-x64' => {
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm',
    },
    'jdk-8u201-linux-x64' => {
      'url' => 'https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm',
    },
    'jdk-8u212-linux-x64' => {
      'url' => 'https://download.oracle.com/otn/java/jdk/8u212-b10/59066701cf1a433da9770636fbc4c9aa/jdk-8u212-linux-x64.rpm',
    },
    'jdk-8u232-linux-x64' => {
      'url' => '',
    },
  },
  'oracle_source' => {
    'jdk-8u102-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_102',
      'alt_priority' => '18000102',
      'url' => 'http://download.oracle.com/otn/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz',
    },
    'jdk-8u131-linux-x64' => {
      'extract_dir' => 'extract_dir',
      'alt_priority' => '18000131',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz',
    },
    'jdk-8u172-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_172',
      'alt_priority' => '18000172',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz',
    },
    'jdk-8u181-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_181',
      'alt_priority' => '18000181',
      'url' => 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz',
    },
    'jdk-8u201-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_201',
      'alt_priority' => '18000201',
      'url' => 'https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz',
    },
    'jdk-8u212-linux-x64' => {
      'extract_dir' => 'jdk1.8.0_212',
      'alt_priority' => '18000212',
      'url' => 'https://download.oracle.com/otn/java/jdk/8u212-b10/59066701cf1a433da9770636fbc4c9aa/jdk-8u212-linux-x64.tar.gz',
    },
    'jdk-8u232-linux-x64' => {
      'extract_dir' => '',
      'alt_priority' => '',
      'url' => '',
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
