class AddUniqueIndexToAssistances < ActiveRecord::Migration[5.1]
  def change
    add_index :assistances, %i[test_id enrollment_id], unique: true
  end
end
