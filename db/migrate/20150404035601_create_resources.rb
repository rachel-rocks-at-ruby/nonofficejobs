class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :link
      t.string :title
      t.string :body
      t.references :user, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
