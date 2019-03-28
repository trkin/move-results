class Venue < ApplicationRecord
  extend Mobility
  translates :name

  has_many :happenings, dependent: :destroy
  has_many :clubs, dependent: :nullify
end
