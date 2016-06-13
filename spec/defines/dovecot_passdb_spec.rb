require 'spec_helper'
describe 'dovecot::passdb', :type => :define  do
  let(:title) { 'testpassdb' }
  it { should contain_file("/etc/dovecot/conf.d/10-passdb-testpassdb.conf").with_content(/^passdb \{$/) }
  context 'string options' do
    options=[ 'args', 'driver' ]
    options.each do |option|
      context option do
        context 'set' do
          let(:params) { { option => 'foo' } }
          it { should contain_file("/etc/dovecot/conf.d/10-passdb-testpassdb.conf").with_content(/^\s*#{option}\s+=\sfoo$/) }
        end
        context 'unset' do
          let(:params) {{}}
          it { should contain_file("/etc/dovecot/conf.d/10-passdb-testpassdb.conf").without_content(/^\s*#{option}\s+=.*$/) }
        end
      end
    end
  end

end
