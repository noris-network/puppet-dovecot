require 'spec_helper'
describe 'dovecot::plugin::sieve' do
  
  context '90-sieve.conf' do
    context 'string options' do
      options=[ 'recipient_delimiter', 'sieve', 'sieve_dir' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 'foo'} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').with_content(/^\s*#{option}\s+=\sfoo$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'int options' do
      options=[ 'sieve_max_redirects' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 42} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').with_content(/^\s*#{option}\s+=\s42$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
    context 'array options' do
      options=[ 'sieve_extensions' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => ['foo', 'bar']} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').with_content(/^\s*#{option}\s+=\sfoo bar$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-sieve.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end

  end
end
