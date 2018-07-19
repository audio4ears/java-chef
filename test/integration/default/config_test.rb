# # encoding: utf-8

# Inspec test for recipe java-chef::config

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'java-chef::config' do
  title 'Testing java config'

  # test file(s)
  describe file('/etc/profile.d/java.sh') do
    it { should exist }
    it { should be_file }
  end

  # test command(s)
  describe command('echo $JAVA_HOME') do
    its('exit_status') { should eq 0 }
  end
end
