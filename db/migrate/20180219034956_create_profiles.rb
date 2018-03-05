class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :company_id
      t.integer :salary
      t.string :phone
      t.string :image
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
