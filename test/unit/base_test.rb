# frozen_string_literal: true

require 'test_helper'

class BaseTest < MiniTest::Test
  def setup; end

  def test_error_response
    expected_response = {:status => 401, :message => "Not Authorized!"}
    assert_equal expected_response, Base.error_response(status: 401)
  end

  def test_access_token
    Base.stub :token, 'test_token' do
      assert_equal 'test_token', Base.token
    end
  end

  def test_refresh_access_token
    Base.stub :token, 'new_token' do
      assert_equal 'new_token', Base.token
    end
  end

  def test_blank_find_params
    assert_equal true, Base.raise_on_blank_find_param
  end
end
