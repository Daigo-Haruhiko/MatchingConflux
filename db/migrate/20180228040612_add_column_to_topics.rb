class AddColumnToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :company_id, :integer
  end
end
