class ResultSampling < ApplicationRecord
  extend Mobility
  translates :name

  belongs_to :happening

  has_many :discipline_happening, dependent: :destroy
  has_many :check_points, dependent: :destroy
end
