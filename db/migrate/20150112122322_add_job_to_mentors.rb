class AddJobToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :job_id, :integer
    add_index :mentors, :job_id
  end
end
