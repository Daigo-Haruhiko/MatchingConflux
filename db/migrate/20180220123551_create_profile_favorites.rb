class CreateProfileFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_favorites do |t|
      t.integer :company_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
