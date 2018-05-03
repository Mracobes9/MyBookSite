class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name, limit: 20, null: false
      t.string :second_name, limit: 20, null: false
      t.string :middle_name, limit: 20, null: false

      t.timestamps
    end
  end
end
