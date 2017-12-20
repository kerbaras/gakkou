class RemplaceYearToLapseInCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :year, :integer
    add_column :courses, :from, :date
    add_column :courses, :to, :date
  end
end
