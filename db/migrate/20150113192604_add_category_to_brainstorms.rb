class AddCategoryToBrainstorms < ActiveRecord::Migration
  def change
    add_column :brainstorms, :category_id, :integer
    add_index :brainstorms, :category_id
  end
end 