require 'spec_helper'
describe 'dovecot::namespace', :type => :define  do
  let(:title) { 'testnamespace' }
  context 'bool options' do
    options=[ 'list', 'inbox', 'hidden' ]
    options.each do |option|
      context option do
        context 'set to false' do
          let(:params) { { option => false } }
          it { should contain_file("/etc/dovecot/conf.d/15-namespace-testnamespace.conf").with_content(/^\s\s#{option}\s+=\sno$/) }
        end
        context 'set to true' do
          let(:params) { { option => true } }
          it { should contain_file("/etc/dovecot/conf.d/15-namespace-testnamespace.conf").with_content(/^\s\s#{option}\s+=\syes$/) }
        end
        context 'unset' do
          let(:params) {{}}
          it { should contain_file("/etc/dovecot/conf.d/15-namespace-testnamespace.conf").without_content(/^\s*#{option}\s+=.*$/) }
        end
      end
    end
  end

  context 'string options' do
    options=[ 'location', 'prefix', 'separator' ]
    options.each do |option|
      context option do
        context 'set' do
          let(:params) { { option => 'foo' } }
          it { should contain_file("/etc/dovecot/conf.d/15-namespace-testnamespace.conf").with_content(/^\s\s#{option}\s+=\sfoo$/) }
        end
        context 'unset' do
          let(:params) {{}}
          it { should contain_file("/etc/dovecot/conf.d/15-namespace-testnamespace.conf").without_content(/^\s*#{option}\s+=.*$/) }
        end
      end
    end
  end

end
