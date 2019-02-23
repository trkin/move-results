class MemberCrew < ApplicationRecord
  belongs_to :member
  belongs_to :crew
end
