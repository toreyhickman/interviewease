class FeedbackResponse < ActiveRecord::Base

  # Accessible attributes

  # Validations
  validates_presenece_of :response

  # Associations
  belongs_to :feedback_question
  belongs_to :employee
  belongs_to :candidate

end
