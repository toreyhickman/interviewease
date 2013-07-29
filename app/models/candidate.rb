class Candidate < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :email, :name

  # Validations
  validates :name, presence: true
  validates_uniqueness_of :name, :scope => :company_id

  # Associations
  belongs_to :company

  has_many :interviews
  has_many :interviewers, :through => :interviews, :source => :employee

  # maybe better names?
  has_many :challenge_assignments
  has_many :attempted_challenges, :through => :given_challenges, :source => :challenge

  # maybe better names?
  has_many :topic_assignments
  has_many :addressed_topics, :through => :covered_topics, :source => :topic

end
