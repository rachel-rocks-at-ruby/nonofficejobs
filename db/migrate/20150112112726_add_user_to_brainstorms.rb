class AddUserToBrainstorms < ActiveRecord::Migration
  def change
    add_column :brainstorms, :user_id, :integer
    add_index :brainstorms, :user_id
  end
end
