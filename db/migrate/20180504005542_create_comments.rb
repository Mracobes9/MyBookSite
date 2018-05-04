class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text, limit:100, null: false, default: ""
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.boolean :is_moderate, null: false, default: false

      t.timestamps
    end
  end
end
