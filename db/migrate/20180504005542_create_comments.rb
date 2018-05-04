class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :book_id
      t.boolean :is_moderate

      t.timestamps
    end
  end
end
