class CheckPoint < ApplicationRecord
  belongs_to :result_sampling

  has_many :results, dependent: :destroy
end
