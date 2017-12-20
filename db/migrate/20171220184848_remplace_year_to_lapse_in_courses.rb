class RemplaceYearToLapseInCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :year, :integer
    add_column :courses, :start, :date
    add_column :courses, :end, :date
  end
end
