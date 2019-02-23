require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture people
  end
end
