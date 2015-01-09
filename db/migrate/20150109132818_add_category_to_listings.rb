class AddCategoryToListings < ActiveRecord::Migration
  def change
    add_column :listings, :category_id, :integer
    add_index :listings, :category_id
  end
end
