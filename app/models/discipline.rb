class Discipline < ApplicationRecord
  extend Mobility
  translates :name

  belongs_to :activity

  has_many :discipline_happenings, dependent: :destroy
  has_many :races, dependent: :destroy
  has_many :check_points, dependent: :destroy

  enum gender: %i[man women mix]
end
