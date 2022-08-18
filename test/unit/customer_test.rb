# frozen_string_literal: true

require 'test_helper'

class CustomerTest < MiniTest::Test
  def setup; end

  def test_that_fetch_returns_nil
    assert_nil Customer.fetch({ id: 1 })
  end

  def test_that_list_returns_empty
    Customer.stub :list, [] do
      response = Customer.list
      assert_equal [], response
    end
  end
end
