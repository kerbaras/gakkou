class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.references :course, foreign_key: true
      t.date :date
      t.string :title
      t.integer :base_grade
      t.integer :upper_grade

      t.timestamps
    end
  end
end
