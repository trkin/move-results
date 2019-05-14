class Activity < ApplicationRecord
  FIELDS = %i[name].freeze
  extend Mobility
  translates :name, :description

  has_many :disciplines, dependent: :destroy
  has_many :activity_associations, dependent: :destroy
  has_many :associated_activities, through: :activity_associations

  validates :name, presence: true
end
