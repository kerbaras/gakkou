class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.integer :identification
      t.string :number

      t.timestamps
    end
  end
end
