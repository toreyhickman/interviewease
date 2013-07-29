class Challenge < ActiveRecord::Base
  # Accessible attributes (not company_id or author_id)
  attr_accessible :title, :description, :code, :test_code, :public

  # Validations
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :code
  validates_presence_of :test_code

  # Associations
  belongs_to :company
  belongs_to :author, :class_name => "Employee"
  has_many :given_challenges
  has_many :attempters, :through => :given_challenges, :source => :candidate
  has_many :feedback_questions, as: :question

end
