class CheckPoint < ApplicationRecord
  belongs_to :discipline

  has_many :results, dependent: :destroy
end
