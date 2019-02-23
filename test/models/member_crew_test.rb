require 'test_helper'

class MemberCrewTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture member_crews
  end
end
