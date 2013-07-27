class FeedbackQuestion < ActiveRecord::Base

  # Accessible attributes

  # Validations
  validates_presence_of :prompt

  # Associations
  belongs_to :question, polymorphic: true
  has_many :feedback_responses

end
