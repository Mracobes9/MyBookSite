class AddFioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, limit: 20, null: false, default: ""
    add_column :users, :second_name, :string, limit: 20, null: false, default: ""
    add_column :users, :middle_name, :string, limit: 20, null: false, default: ""
  end
end
