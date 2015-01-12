class CreateBrainstorms < ActiveRecord::Migration
  def change
    create_table :brainstorms do |t|
      t.string :title
      t.text :description
      
      t.timestamps
    end
  end
end
