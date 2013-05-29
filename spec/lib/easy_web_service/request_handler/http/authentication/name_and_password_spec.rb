require 'spec_helper'

describe EasyWebService::RequestHandler::Http::Authentication::NameAndPassword do
  before :each do
    EasyWebService::Setting.stub!(:config).and_return({
      'foo' => {
        'authentication' => {
          'name_and_password' => {
            'password' => '53CUR3'
          }
        }
      }
    })
  end

  describe "#generate_credentials_for" do
    before{ subject.generate_credentials_for("foo") }

    its(:credentials){ should == {:app_name => 'foo', :app_secret => '53CUR3'} }
  end
end
