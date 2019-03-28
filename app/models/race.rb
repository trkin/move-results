class Race < ApplicationRecord
  belongs_to :discipline_happening

  has_many :crews, dependent: :destroy

  enum category: %i[final semifinal qualification]
end
