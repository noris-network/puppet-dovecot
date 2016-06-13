require 'spec_helper'
describe 'dovecot::plugin::lazy_expunge' do
  
  context '90-lazy_expunge.conf' do
    context 'string options' do
      options=[ 'lazy_expunge' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => 'foo'} }
            it { should contain_file('/etc/dovecot/conf.d/90-lazy_expunge.conf').with_content(/^\s*#{option}\s+=\sfoo$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-lazy_expunge.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
