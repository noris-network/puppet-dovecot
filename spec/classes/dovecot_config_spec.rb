require 'spec_helper'
describe 'dovecot::config' do
 
  context 'dovecot.conf' do
    it { should contain_file('/etc/dovecot/dovecot.conf').with_source('puppet:///modules/dovecot/dovecot.conf') }
  end
  context '10-master.conf' do
    context 'bool options' do
      options=[ 'disable_plaintext_auth', 'dotlock_use_excl', 'mail_debug', 'mail_nfs_index', 'mail_nfs_storage', 'mmap_disable', 'shutdown_clients', 'verbose_proctitle']
      options.each do |option|
        context option do
          context 'set to false' do
            let(:pre_condition) { "class {'dovecot': " + option + " => false}" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').with_content(/^#{option}\s+=\sno$/) }
          end
          context 'set to true' do
            let(:pre_condition) { "class {'dovecot': " + option + " => true}" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').with_content(/^#{option}\s+=\syes$/) }
          end
          context 'unset' do
            let(:pre_condition) { "class {'dovecot': }" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').without_content(/^#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'string options' do
      options=[ 'mail_fsync' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:pre_condition) { "class {'dovecot': " + option + " => 'foo'}" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').with_content(/^#{option}\s+=\sfoo$/) }
          end
          context 'is unset' do
            let(:pre_condition) { "class {'dovecot': }" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').without_content(/^#{option}\s+=.*$/) }
          end
        end
      end
    end

    context 'array options without defaults' do
      options=[ 'mail_plugins', 'protocols' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:pre_condition) { "class {'dovecot': " + option + " => ['foo','bar']}" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').with_content(/^#{option}\s+=\sfoo bar$/) }
          end
          context 'is unset' do
            let(:pre_condition) { "class {'dovecot': }" }
            it { should contain_file('/etc/dovecot/conf.d/10-master.conf').without_content(/^#{option}\s+=.*$/) }
          end
        end
      end

    end
  end

  context '10-ssl.conf ' do
    options=[ 'ssl_cert', 'ssl_key' ]
    options.each do |option|
      context option do
        context 'is set' do
          let(:pre_condition) { "class {'dovecot': " + option + " => '/foo/bar'}" }
          it { should contain_file('/etc/dovecot/conf.d/10-ssl.conf').with_content(/^#{option}\s+=\s<\/foo\/bar$/) }
        end
      end
    end
    context 'non set' do
      let(:pre_condition) { "class {'dovecot': }" }
      it { should_not contain_file('/etc/dovecot/conf.d/10-ssl.conf') }
    end
  end

  context '10-sieve.conf ' do
    options=[ 'managesieve_sieve_capability' ]
    options.each do |option|
      context option do
        context 'is set' do
          let(:pre_condition) { "class {'dovecot': " + option + " => ['foo','bar']}" }
          it { should contain_file('/etc/dovecot/conf.d/10-sieve.conf').with_content(/^#{option}\s+=\sfoo bar$/) }
        end
      end
    end
    context 'non set' do
      let(:pre_condition) { "class {'dovecot': }" }
      it { should_not contain_file('/etc/dovecot/conf.d/10-sieve.conf') }
    end
  end

end
