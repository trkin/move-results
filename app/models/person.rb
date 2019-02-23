class Person < ApplicationRecord
  has_many :members, dependent: :destroy
end
