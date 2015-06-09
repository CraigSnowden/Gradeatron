class Student < ActiveRecord::Base
  has_many :grades
  accepts_nested_attributes_for :grades
  validates_numericality_of :year,
    :less_than_or_equal_to => 5,
    :greater_than_or_equal_to => 1,
    :only_integer => false

  def weighted_average
    credits = 0
    percents = 0
    grades.each do |g|
      percents += g.percentage * g.course.credits
      credits += g.course.credits
    end
    return percents.to_f / credits.to_f
  end
end
