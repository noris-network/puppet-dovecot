require 'spec_helper'
describe 'dovecot::protocol::lmtp' do
  
  context '20-protocol-lmtp.conf' do
    it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').with_content(/^protocol lmtp \{$/) }
    context 'bool options' do
      options=[ 'lmtp_save_to_detail_mailbox' ]
      options.each do |option|
        context option do
          context 'is true' do
            let(:params) { { option => true} }
            it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').with_content(/^\s*#{option}\s+=\syes$/) }
          end
          context 'is false' do
            let(:params) { { option => false} }
            it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').with_content(/^\s*#{option}\s+=\sno$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'mail_plugins' do
      context 'is set' do
        let(:params) { { 'mail_plugins' => [ 'foo', 'bar' ]} }
        it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').with_content(/^\s*mail_plugins\s+=\sfoo bar$/) }
      end
      context 'is unset' do
        let(:params) { {} }
        it { should contain_file('/etc/dovecot/conf.d/20-protocol-lmtp.conf').with_content(/^\s*mail_plugins\s+=\s\$mail_plugins$/) }
      end
    end

  end
end
