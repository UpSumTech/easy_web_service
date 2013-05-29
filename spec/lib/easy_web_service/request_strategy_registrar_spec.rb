require 'spec_helper'

describe EasyWebService::RequestStrategyRegistrar do
  module EasyWebService::RequestHandler
    class Test < Base; end
  end

  subject{ EasyWebService::RequestStrategyRegistrar.new }

  let(:registered_strategies){ subject.instance_variable_get('@registered_strategies') }

  describe "#initialize" do

    it "should already contain base strategy" do
      registered_strategies[:base].should be_a EasyWebService::RequestHandler::Base
    end
  end

  describe "#register" do
    it "should register a new handler with the request strategies" do
      subject.register(:test)
      registered_strategies[:test].should be_a EasyWebService::RequestHandler::Test
    end
  end

  describe "#get" do
    before{ subject.register(:test) }

    it "should get the handler for the specific strategy" do
      subject.get(:test).should be_an_instance_of EasyWebService::RequestHandler::Test
    end
  end
end
