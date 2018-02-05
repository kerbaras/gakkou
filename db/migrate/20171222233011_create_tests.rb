class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.references :course, foreign_key: true
      t.date :date
      t.string :title
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
