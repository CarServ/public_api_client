# frozen_string_literal: true

require_relative "../test_helper"

describe "#version" do
  it "should return a version" do
    refute_nil Carserv::PublicApi::Client::VERSION
  end
end
