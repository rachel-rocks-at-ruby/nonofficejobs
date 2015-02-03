class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :about, :text
    add_column :users, :aspirations, :text
  end
end
