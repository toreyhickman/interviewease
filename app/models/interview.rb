class Interview < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :start, :complete, :candidate_id, :employee_id 

  # Validations
  validates_presence_of :candidate_id
  validates_uniqueness_of :identifier

  # Associations
  belongs_to :employee
  belongs_to :candidate

  has_many :given_challenges
  has_many :challenges, :through => :given_challenges

  # Callback functions
  before_save :create_identifier

  # Methods
  def to_param
    identifier
  end

  # Private methods
  private
  def random_letters(n)
    ("A".."Z").to_a.shuffle.join.slice(0..(n-1))
  end

  def random_digits(n)
    (1..9).to_a.shuffle.join.slice(0..(n-1))
  end

  def random_string
    string = ""
    string << (random_letters(4) + "-")
    2.times { string << (random_digits(4) + "-") }
    string << random_letters(4)
    string
  end

  def create_identifier
    self.identifier ||= random_string
  end

end
