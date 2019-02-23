require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture events
  end

  test '_end_date_greater_or_equal_start_date' do
    event = Event.new start_date: Time.zone.today, end_date: Time.zone.today - 1.day
    event.valid?
    assert_not_empty event.errors[:end_date]
    event.end_date = Time.zone.today
    event.valid?
    assert_empty event.errors[:end_date]
  end
end
