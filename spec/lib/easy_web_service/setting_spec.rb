require 'spec_helper'

describe EasyWebService::Setting do
  class << EasyWebService::Setting
    def config
      {'foo' => {
          'v1' => {'base_uri' => 'http://example.com'},
          'authentication' => {
            'name_and_password' => {'name' => 'Foo', 'password' => 'BarBazBlah'}
          }
        }
      }
    end
  end

  describe ".request" do
    it "should return the settings for the request" do
      result = EasyWebService::Setting.request('foo', 'v1')
      result.base_uri.should eq("http://example.com")
    end
  end

  describe ".authentication" do
    it "should return the settings for the authentication" do
      result = EasyWebService::Setting.authentication('foo', 'name_and_password')
      result.name.should eq('Foo')
      result.password.should eq('BarBazBlah')
    end
  end
end
