class GivenChallenge < ActiveRecord::Base

  # Accessible attributes

  # Validations

  # Associations
  belongs_to :challenge
  belongs_to :candidate
  belongs_to :interview
end
