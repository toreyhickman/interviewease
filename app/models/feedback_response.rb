class FeedbackResponse < ActiveRecord::Base

  # Accessible attributes
  attr_accessible :response, :feedback_question_id, :candidate_id

  # Validations
  validates_presence_of :response

  # Associations
  belongs_to :feedback_question
  belongs_to :employee
  belongs_to :candidate

end
