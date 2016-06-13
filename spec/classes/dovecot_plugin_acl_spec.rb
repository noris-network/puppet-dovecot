require 'spec_helper'
describe 'dovecot::plugin::acl' do
  
  context '90-acl.conf' do
    context 'string options' do
      options=[ 'acl' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 'foo'} }
            it { should contain_file('/etc/dovecot/conf.d/90-acl.conf').with_content(/^\s*#{option}\s+=\sfoo$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-acl.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
