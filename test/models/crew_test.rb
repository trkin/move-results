require 'test_helper'

class CrewTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture crews
  end
end
