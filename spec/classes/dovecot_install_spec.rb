require 'spec_helper'
describe 'dovecot::install' do

  context 'with all packages' do
    let(:pre_condition) { "class {'dovecot': protocols => [ 'lmtp', 'sieve', 'pop3', 'imap'] }" }
    it { should contain_class('dovecot::install') }
    let(:exim__enable_imapd) { true }
    [ 'dovecot-core', 'dovecot-imapd' , 'dovecot-lmtpd', 'dovecot-managesieved', 'dovecot-pop3d', 'dovecot-sieve' ].each do |package|
      it { should contain_package(package) }
    end
  end
end
