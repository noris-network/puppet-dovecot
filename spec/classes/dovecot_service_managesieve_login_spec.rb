require 'spec_helper'
describe 'dovecot::service::managesieve_login' do
  
  context '10-service-managesieve_login.conf' do
    context 'hash options' do
      options=[ 'inet_listener' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => {'sieve' => { 'port' => 2000 } }}}
            it { should contain_file('/etc/dovecot/conf.d/10-service-managesieve-login.conf').with_content(/^service managesieve-login \{$/) }
            it { should contain_file('/etc/dovecot/conf.d/10-service-managesieve-login.conf').with_content(/^\s*#{option}\ssieve \{\n\s+port\s=\s2000\n\s\s\}$/) }
          end
        end
      end
    end
  end
end
