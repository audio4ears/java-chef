# java-chef

This cookbook installs [Java](https://www.oracle.com/java/index.html), a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers "write once, run anywhere" (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.

### Usage

#### I. Berksfile

Update berksfile to include the cookbook from github.

```ruby
# add cookbook from github
cookbook "java-chef", "~> 0.1.0", git: "https://github.com/audio4ears/java-chef.git"
```

#### II. Metadata.rb

Update metadata.rb to include cookbook dependency

```ruby
# include cookbook dependency
depends 'java-chef'
```

#### III. Include Cookbook

Include cookbook recipe in your recipe.

```ruby
# include cookbook recipe
include_recipe "java-chef"
```

#### IV. Define Attributes

Define attributes based on your desired flavor of java installation. Currently the following versions are supported:

- openjdk_package - package install from local default repo
- oracle_package - package install from local custom repo
- oracle_rpm - rpm install from oracle site
- oracle_source - source install from oracle site

```ruby
# install oracle from source
node['java']['install_from'] = 'oracle_source'
node['java']['install_version'] = 'jdk-8u131-linux-x64'
```
