class AddJobToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :job_id, :integer
    add_index :posts, :job_id
  end
end
