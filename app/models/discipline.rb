class Discipline < ApplicationRecord
  belongs_to :activity
  belongs_to :event

  has_many :races, dependent: :destroy
  has_many :check_points, dependent: :destroy

  enum gender: %i[man women mix]
end
