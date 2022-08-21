require 'spec_helper_acceptance'

pp_defaults = <<-PUPPETCODE
  class { 'java': }
  class { 'nifi_toolkit': }

  package { 'unzip': before => Class['nifi_toolkit']}
  package { 'coreutils': before => Class['nifi_toolkit']}

  Class['java'] -> Class['nifi_toolkit']
PUPPETCODE

describe 'NiFi Toolkit' do
  idempotent_apply(pp_defaults)

  describe file('/opt/nifi-toolkit') do
    it { is_expected.to be_directory }
  end

  describe file('/opt/nifi-toolkit/current/conf') do
    it { is_expected.to be_directory }
  end

  describe file('/usr/local/bin/nifi-cli') do
    it { is_expected.to be_file }
  end

  describe command('nifi-cli session show') do
    its(:exit_status) { is_expected.to be 0 }
  end
end
