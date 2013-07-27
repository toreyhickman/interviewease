class Employee < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :email, :name, :password_hash

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true

  # Associations
  belongs_to :company

  has_many :interviews
  has_many :interviewees, :through => :interviews, :scope => :candidate
  has_many :feedback_responses
  has_many :written_challenges, :class_name => "Challenge"

end
