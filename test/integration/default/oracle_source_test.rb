# # encoding: utf-8

# Inspec test for recipe java-chef::oracle_source

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'java-chef::oracle_source' do
  title 'Testing java source installation'

  # test package(s)
  describe package('unzip') do
    it { should be_installed }
  end

  # test directories
  describe file('/usr/java') do
    it { should exist }
    it { should be_directory }
  end
  describe file('/usr/java/tmp') do
    it { should exist }
    it { should be_directory }
  end

  # test file(s)
  describe file('/usr/java/tmp/postinstall.sh') do
    it { should exist }
    it { should be_file }
  end
  describe file('/usr/java/tmp/verify.sh') do
    it { should exist }
    it { should be_file }
  end

  # test symlink(s)
  describe file('/usr/java/default') do
    it { should exist }
    it { should be_symlink }
  end
  describe file('/usr/java/latest') do
    it { should exist }
    it { should be_symlink }
  end

  # test commands
  describe command('java -version') do
    its('exit_status') { should eq 0 }
  end
end
