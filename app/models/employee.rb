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
  has_many :interviewees, :through => :interviews, :source => :candidate
  has_many :feedback_responses
  has_many :written_challenges, :class_name => "Challenge"

  # bcrypt
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
