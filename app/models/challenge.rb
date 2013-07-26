class Challenge < ActiveRecord::Base
  attr_accessible :questions

  validates :questions, presence: true
  belongs_to :company
  belongs_to :interview

end
