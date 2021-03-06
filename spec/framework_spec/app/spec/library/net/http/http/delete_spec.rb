require File.expand_path('../../../../../spec_helper', __FILE__)
require 'net/http'
require File.expand_path('../fixtures/http_server', __FILE__)

describe "Net::HTTP#delete" do
  before(:all) do
    NetHTTPSpecs.start_server
  end

  after(:all) do
    NetHTTPSpecs.stop_server
  end

  before(:each) do
    @http = Net::HTTP.start("127.0.0.1", NetHTTPSpecs.server_port)
  end

  it "sends a DELETE request to the passed path and returns the response" do
    response = @http.delete("/request")
    response.should be_kind_of(Net::HTTPResponse)
    response.body.should == "Request type: DELETE"
  end
end
