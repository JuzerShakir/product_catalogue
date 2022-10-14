class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name

      t.timestamps
    end
    add_index :properties, :name, unique: true
  end
end
