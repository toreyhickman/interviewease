class GivenChallenge < ActiveRecord::Base

  # Accessible attributes
  attr_accessible :candidate_id, :challenge_id, :interview_id

  # Validations
  validates_uniqueness_of :challenge_id, :scope => :interview_id

  # Associations
  belongs_to :challenge
  belongs_to :candidate
  belongs_to :interview
end
