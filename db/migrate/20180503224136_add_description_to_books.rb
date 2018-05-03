class AddDescriptionToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :description, :text, limit: 200, null: false, default: ""
  end
end
