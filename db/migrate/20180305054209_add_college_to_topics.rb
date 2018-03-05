class AddCollegeToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :college, :string
    add_column :topics, :address, :string
  end
end
