require 'spec_helper'
describe 'dovecot::service::imap_login' do
  
  context '10-service-imap-login.conf' do
    it { should contain_file('/etc/dovecot/conf.d/10-service-imap-login.conf').with_content(/^service imap-login \{$/) }
    context 'integer options' do
      options=[ 'process_limit', 'client_limit', 'service_count' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 42} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-imap-login.conf').with_content(/^\s*#{option}\s+=\s42$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-imap-login.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
