class Venue < ApplicationRecord
  extend Mobility
  translates :name

  has_many :events, dependent: :destroy
  has_many :clubs, dependent: :nullify
end
