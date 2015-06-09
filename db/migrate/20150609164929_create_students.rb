class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :year
    end
  end
end
