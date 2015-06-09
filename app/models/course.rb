class Course < ActiveRecord::Base
  has_many :grades

  def to_s
    return acronym
  end
end
