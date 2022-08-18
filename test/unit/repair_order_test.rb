# frozen_string_literal: true

require 'test_helper'

class RepairOrderTest < MiniTest::Test
  def setup; end

  def test_that_fetch_return_data
    assert_nil RepairOrder.fetch({ id: 1 })
  end
end
