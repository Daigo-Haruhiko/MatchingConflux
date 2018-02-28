class AddColumnToTopicFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :topic_favorites, :company_id, :integer
  end
end
