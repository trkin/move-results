class Activity < ApplicationRecord
  extend Mobility
  translates :name, :description

  has_many :disciplines, dependent: :destroy
  has_many :activity_associations, dependent: :destroy
  has_many :associated_activities, through: :activity_associations
end
