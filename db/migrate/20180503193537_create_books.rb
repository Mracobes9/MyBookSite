class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name, limit:30, null: false
      t.integer :author_id, null: false
      t.string :book_cover, null: false

      t.timestamps
    end
    add_index :books, :author_id
    add_foreign_key :books, :authors
  end
end
