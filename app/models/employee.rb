class Employee < ActiveRecord::Base
  attr_accessible :email, :name, :password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

end
