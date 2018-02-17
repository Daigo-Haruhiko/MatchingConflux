class AddColumnToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name, :string, null: false, default: ""
    add_column :companies, :avatar, :string
  end
end
