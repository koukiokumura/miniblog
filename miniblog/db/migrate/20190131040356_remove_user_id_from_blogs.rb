class RemoveUserIdFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :User_id, :integer
  end
end
