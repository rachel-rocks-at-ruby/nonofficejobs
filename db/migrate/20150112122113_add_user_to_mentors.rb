class AddUserToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :user_id, :integer
    add_index :mentors, :user_id
  end
end
