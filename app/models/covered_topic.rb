class CoveredTopic < ActiveRecord::Base

  # Accessible attributes
  attr_accessible 

  # Validations

  # Associations
  belongs_to :topic
  belongs_to :candidate

end
