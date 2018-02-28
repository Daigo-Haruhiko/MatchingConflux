class AddColumnToTopicComments < ActiveRecord::Migration[5.1]
  def change
    add_column :topic_comments, :company_id, :integer
  end
end
