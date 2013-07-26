class Interview < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true 
  has_many :challenges
  has_many :candidates
  belongs_to :employee
  belongs_to :company

end
