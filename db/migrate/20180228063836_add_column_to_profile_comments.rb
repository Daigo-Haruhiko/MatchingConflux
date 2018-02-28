class AddColumnToProfileComments < ActiveRecord::Migration[5.1]
  def change
    add_column :profile_comments, :user_id, :integer
  end
end
