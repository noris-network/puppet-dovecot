require 'spec_helper'
describe 'dovecot::service::pop3_login' do
  
  context '10-service-pop3-login.conf' do
    it { should contain_file('/etc/dovecot/conf.d/10-service-pop3-login.conf').with_content(/^service pop3-login \{$/) }
    context 'integer options' do
      options=[ 'process_limit', 'client_limit', 'service_count' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 42} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-pop3-login.conf').with_content(/^\s*#{option}\s+=\s42$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-pop3-login.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
