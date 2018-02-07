class CreateAssistances < ActiveRecord::Migration[5.1]
  def change
    create_table :assistances do |t|
      t.references :enrollment, foreign_key: true
      t.references :test, foreign_key: true
      t.decimal :grade

      t.timestamps
    end
  end
end
