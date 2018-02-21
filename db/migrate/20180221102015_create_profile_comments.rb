class CreateProfileComments < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_comments do |t|
      t.integer :company_id
      t.integer :profile_id
      t.string :comment

      t.timestamps
    end
  end
end
