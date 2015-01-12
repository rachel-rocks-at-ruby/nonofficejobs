class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.text :description

      t.timestamps
    end
  end
end
