class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
