# frozen_string_literal: true

require 'test_helper'

class RepairOrderTest < MiniTest::Test
  def setup
    @meme = RepairOrder
  end

  def test_that_fetch_return_data
    assert_equal nil, RepairOrder.fetch({ id: 1 })
  end

  def test_error_response
    expected_response = {:status => 401, :message => "Not Authorized!"}
    assert_equal expected_response, RepairOrder.error_response(status: 401)
  end
end
