class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :percentage
      t.references :student, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
    end
  end
end
