require 'test_helper'

class CheckPointTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture check_points
  end
end
