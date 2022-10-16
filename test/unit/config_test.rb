# frozen_string_literal: true

require_relative "../test_helper"

describe "#initialize" do
  it "should return a config object" do
    config = Carserv::PublicApi::Client::Config.new
    assert_nil config.api_key
    assert_nil config.api_secret
    assert_equal 50, config.items_per_page
    assert_equal :net_http, config.faraday_adapter
  end
end
