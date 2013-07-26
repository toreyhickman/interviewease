class Candidate < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :employees
  has_many :interviews
  has_many :challenges

end
