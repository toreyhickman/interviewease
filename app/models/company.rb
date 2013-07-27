class Company < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true

  # Associations
  has_many :employees
  has_many :candidates
  has_many :challenges
  has_many :topics
  has_many :feedback_questions, as: :question

end
