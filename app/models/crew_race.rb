class CrewRace < ApplicationRecord
  belongs_to :crew
  belongs_to :race

  has_many :results, dependent: :destroy
end
