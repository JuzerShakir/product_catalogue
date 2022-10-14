class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :upc, null: false
      t.datetime :available_on, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :upc, unique: true
  end
end
