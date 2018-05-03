class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.string :book_cover
      t.string :string

      t.timestamps
    end
  end
end
