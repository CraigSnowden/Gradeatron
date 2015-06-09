class Course < ActiveRecord::Base
  has_many :grades
  default_scope {order('acronym ASC')}
  def to_s
    return acronym
  end
end
