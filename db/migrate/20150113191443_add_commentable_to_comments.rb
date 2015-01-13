class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable, index: true
    remove_column :comments, :post_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
