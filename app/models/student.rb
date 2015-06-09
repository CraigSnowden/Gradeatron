class Student < ActiveRecord::Base
  has_many :grades
  accepts_nested_attributes_for :grades
  validates_numericality_of :year,
    :less_than_or_equal_to => 5,
    :greater_than_or_equal_to => 1,
    :only_integer => false
end
