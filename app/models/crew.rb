class Crew < ApplicationRecord
  belongs_to :race

  # for each chech point
  has_many :results, dependent: :destroy
  has_many :member_crews, dependent: :destroy

  validate :_number_of_crew_match_discipline

  def _number_of_crew_match_discipline
    return unless race

    target_number = race.discipline.number_of_crew
    return if member_crews.length == target_number

    errors.add(:base, t('count_members_are_needed', count: target_number))
  end
end
