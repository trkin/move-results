class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :clubs, dependent: :nullify
end
