class Result < ApplicationRecord
  belongs_to :crew_race
  # if check_points if blank that is final result, otherwise it is one of the
  # crew_race.race.discipline_happening.result_sampling.check_points
  belongs_to :check_point, optional: true
end
