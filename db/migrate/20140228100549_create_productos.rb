class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :name, limit: 255
      t.text :description
      t.datetime :added_at
      t.string :manufacturer
      t.integer :stock

      t.timestamps
    end
  end
end
