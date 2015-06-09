class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :acronym
      t.date :exam_date
      t.integer :credits
    end
  end
end
