class Event < ApplicationRecord
  extend Mobility
  translates :name

  belongs_to :club
  belongs_to :venue

  has_many :disciplines, dependent: :destroy

  validate :_end_date_greater_or_equal_start_date

  def _end_date_greater_or_equal_start_date
    return if end_date.blank? || start_date.blank?
    return if end_date >= start_date

    errors.add :end_date, t('can_not_be_greater_than_item_name', item_name: Event.human_attribute_name(:start_date))
  end
end
