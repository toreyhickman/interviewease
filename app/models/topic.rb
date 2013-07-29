class Topic < ActiveRecord::Base

  # Accessible attributes
  attr_accessible :name, :company_id

  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  # Associations
  belongs_to :company
  has_many :topic_assignments
  has_many :candidates, :through => :covered_topics

end
