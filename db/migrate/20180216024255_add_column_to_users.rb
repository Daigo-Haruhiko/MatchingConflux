class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :age, :string, null: false, default: ""
    # add_column :users, :college, :string
    add_column :users, :avatar, :string
  end
end
