require 'spec_helper'

describe EasyWebService::ResourceHandler::BaseHandler do
  subject do
    obj = OpenStruct.new
    obj.extend(EasyWebService::ResourceHandler::BaseHandler)
    obj.stub!(:id).and_return(1)
    obj
  end

  its(:mapped_resource_on_remote){ should eq(:open_struct) }
  its(:remote_app_resource_uid){ should eq(1) }

  its(:path_for_read){ should eq("open_structs/1.json") }
  its(:path_for_create){ should eq("open_structs.json") }
  its(:path_for_update){ should eq("open_structs/1.json") }
  its(:path_for_delete){ should eq("open_structs/1.json") }

end
