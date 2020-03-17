require 'spec_helper_acceptance'

pp_defaults = <<-PUPPETCODE
  class { 'java': }
  class { 'nifi_toolkit': }

  Class['java'] -> Class['nifi_toolkit']
PUPPETCODE

describe 'NiFi Toolkit' do
  idempotent_apply(pp_defaults)

  describe file('/opt/nifi-toolkit') do
    it { is_expected.to be_directory }
  end
end
