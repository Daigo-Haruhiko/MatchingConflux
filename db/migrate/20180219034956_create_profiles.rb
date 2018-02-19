class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :company_id
      t.string :salary
      t.string :phone
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
