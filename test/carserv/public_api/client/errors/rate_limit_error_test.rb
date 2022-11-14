# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Errors::RateLimitError do
  describe ".check_retry" do
    error_instance = Carserv::PublicApi::Client::Errors::RateLimitError.new("TEST")

    context "when retry count is 1" do
      it "should call wait_for with 30 seconds interval" do
        mock = MiniTest::Mock.new
        mock.expect(:wait_for, nil, [interval: 30])
        error_instance.stub :wait_for, ->(arg) { mock.wait_for arg } do
          error_instance.check_retry(retry_count: 1)
        end
        assert mock.verify
      end
    end

    context "when retry count is 2" do
      it "should call wait_for with 60 seconds interval" do
        mock = MiniTest::Mock.new
        mock.expect(:wait_for, nil, [interval: 60])
        error_instance.stub :wait_for, ->(arg) { mock.wait_for arg } do
          error_instance.check_retry(retry_count: 2)
        end
        assert mock.verify
      end
    end

    context "when retry count is 3" do
      it "should call wait_for with 60 seconds interval" do
        mock = MiniTest::Mock.new
        mock.expect(:wait_for, nil, [interval: 180])
        error_instance.stub :wait_for, ->(arg) { mock.wait_for arg } do
          error_instance.check_retry(retry_count: 3)
        end
        assert mock.verify
      end
    end
  end
end
