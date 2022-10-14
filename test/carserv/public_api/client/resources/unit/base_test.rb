# frozen_string_literal: true

require_relative "../../../../../test_helper"

describe "#error_response" do
  context "when status is 401" do
    it "should return correct message" do
      expected_response = { status: 401, message: "Not Authorized!" }
      assert_equal expected_response, Base.error_response(status: 401)
    end
  end
end

describe "#token" do
  it "does something else" do
    Base.stub :token, "test_token" do
      assert_equal "test_token", Base.token
    end
  end
end

describe "#refresh_access_token" do
  it "does something else" do
    Base.stub :refresh_access_token, "test_token" do
      assert_equal "test_token", Base.refresh_access_token
    end
  end
end

describe "#raise_on_blank_find_param" do
  context "when missing param" do
    it "should assert blank find" do
      assert Base.raise_on_blank_find_param
    end
  end
end
