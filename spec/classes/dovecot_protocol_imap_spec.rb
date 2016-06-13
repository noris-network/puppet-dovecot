require 'spec_helper'
describe 'dovecot::protocol::imap' do
  
  context '10-protocol-imap.conf' do
    it { should contain_file('/etc/dovecot/conf.d/20-protocol-imap.conf').with_content(/^protocol imap \{$/) }
    context 'integer options' do
      options=[ 'mail_max_userip_connections' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 42} }
            it { should contain_file('/etc/dovecot/conf.d/20-protocol-imap.conf').with_content(/^\s*#{option}\s+=\s42$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/20-protocol-imap.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'mail_plugins' do
      context 'is set' do
        let(:params) { { 'mail_plugins' => [ 'foo', 'bar' ]} }
        it { should contain_file('/etc/dovecot/conf.d/20-protocol-imap.conf').with_content(/^\s*mail_plugins\s+=\sfoo bar$/) }
      end
      context 'is unset' do
        let(:params) { {} }
        it { should contain_file('/etc/dovecot/conf.d/20-protocol-imap.conf').with_content(/^\s*mail_plugins\s+=\s\$mail_plugins$/) }
      end
    end

  end
end
