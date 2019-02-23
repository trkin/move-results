class ActivityAssociation < ApplicationRecord
  belongs_to :activity
  belongs_to :associated_activity, class_name: 'Activity'

  enum category: %i[consists_of similar]
end
