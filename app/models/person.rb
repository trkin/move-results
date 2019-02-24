class Person < ApplicationRecord
  extend Mobility
  translates :name

  has_many :members, dependent: :destroy
end
