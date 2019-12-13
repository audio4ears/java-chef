# java-chef

[![Build Status](https://travis-ci.org/hansohn/java-chef.svg?branch=master)](https://travis-ci.org/hansohn/java-chef) [![GitHub tag](https://img.shields.io/github/tag/hansohn/java-chef.svg)](https://github.com/hansohn/java-chef)

This cookbook installs Java JDK, which is typically utilized to satisfy the Java prerequisite for other applications.

### Why another Java Cookbook?

There is a problem with Oracle and OpenJDK Java distributions competing for Linux [alternatives](https://linux.die.net/man/8/alternatives) priority. In this competition OpenJDK will always win because while it follows Oracle's alternative priority schema, it adds an additional `0` to the priority value.

```bash
# EXAMPLE - default behavior
# Java SE Development Kit 8u232
- oracle alternatives priority = 180232
- openjdk alternatives priority = 1800232
```

This behavior causes problems when you have Oracle Java installed and another package blindly installs OpenJDK as one of its prerequisites. To mitigate this issue I created a cookbook that follows the same priority schema as Oracle and OpenJDK but adds an additional `0` to the priority to guarantee use.

```bash
# EXAMPLE - modified behavior
# Java SE Development Kit 8u232
- oracle alternatives priority = 180232
- openjdk alternatives priority = 1800232
- java-chef alternatives priority = 18000232
```

### Java Flavors

- amazon_rpm: install amazon corretto rpm from amazon site
- amazon_source: install amazon corretto source from amazon site
- openjdk_package: install openjdk package from local default repo

Java flavors can be selected by adding the following key/values to your attributes file:

```ruby
# amazon_rpm
node['java']['install_from'] = 'amazon_rpm'
node['java']['install_version'] = 'jdk-8u232-linux-x64'

# amazon source
node['java']['install_from'] = 'amazon_source'
node['java']['install_version'] = 'jdk-8u232-linux-x64'

# openjdk_package
node['java']['install_from'] = 'openjdk_package'
node['java']['install_version'] = 'java-1.8.0-openjdk-devel'
```

### Usage

#### Step 1: Berksfile

Update berksfile to include the cookbook from github

```ruby
# add cookbook from github
cookbook "java-chef", "~> 2.2.0", git: "https://github.com/hansohn/java-chef.git"
```

#### Step 2: Metadata.rb

Update metadata.rb to include cookbook dependency

```ruby
# include cookbook dependency
depends 'java-chef'
```

#### Step 3: Include Cookbook

Include cookbook recipe in your recipe

```ruby
# include cookbook recipe
include_recipe "java-chef"
```

#### Step 4: Define Attributes

Define version on java to be installed in your attributes file

```ruby
# install jdk from amazon source
node['java']['install_from'] = 'amazon_source'
node['java']['install_version'] = 'jdk-8u232-linux-x64'
```
