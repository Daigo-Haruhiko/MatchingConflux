class AddColumnToProfileFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :profile_favorites, :user_id, :integer
  end
end
