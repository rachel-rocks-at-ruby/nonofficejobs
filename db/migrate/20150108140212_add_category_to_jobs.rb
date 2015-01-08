class AddCategoryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :category_id, :integer
    add_index :jobs, :category_id
  end
end
