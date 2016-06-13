require 'spec_helper'
describe 'dovecot::service::lmtp' do
  
  context '10-service-lmtp.conf' do
    it { should contain_file('/etc/dovecot/conf.d/10-service-lmtp.conf').with_content(/^service lmtp \{$/) }
    context 'integer options' do
      options=[ 'process_limit' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 42} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-lmtp.conf').with_content(/^\s*#{option}\s+=\s42$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-lmtp.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'string options' do
      options=[ 'vsz_limit' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 'foo'} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-lmtp.conf').with_content(/^\s*#{option}\s+=\sfoo$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/10-service-lmtp.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
