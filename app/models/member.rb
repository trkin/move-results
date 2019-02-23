class Member < ApplicationRecord
  belongs_to :club
  belongs_to :person

  has_many :member_crews, dependent: :destroy
end
