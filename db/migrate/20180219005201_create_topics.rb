class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :image
      t.string :description
      t.integer :salary
      t.string :phone

      t.timestamps
    end
  end
end
