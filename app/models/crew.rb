class Crew < ApplicationRecord
  belongs_to :discipline_happening
  belongs_to :club, optional: true

  has_many :crew_races, dependent: :destroy
  has_many :member_crews, dependent: :destroy

  validate :_number_of_crew_match_discipline

  def _number_of_crew_match_discipline
    return unless discipline_happening

    target_number = discipline_happening.discipline.number_of_crew
    real_count = member_crews.length
    return if real_count == target_number

    errors.add(:base, t('crew_number_should_be_taget_count_instead_of_real_count',
                        target_count: target_number, real_count: real_count))
  end
end
