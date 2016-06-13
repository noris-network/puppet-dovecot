require 'spec_helper'
describe 'dovecot::plugin::mail_log' do
  
  context '90-mail_log.conf' do
    context 'array options' do
      options=[ 'mail_log_fields', 'mail_log_events' ]
      options.each do |option|
        context option do
          context 'is set' do
            let(:params) { { option => ['foo','bar'] } }
            it { should contain_file('/etc/dovecot/conf.d/90-mail_log.conf').with_content(/^\s*#{option}\s+=\sfoo bar$/) }
          end
          context 'is unset' do
            let(:params) { {} }
            it { should contain_file('/etc/dovecot/conf.d/90-mail_log.conf').without_content(/^\s*#{option}\s+=.*$/) }
          end
        end
      end
    end
  end
end
