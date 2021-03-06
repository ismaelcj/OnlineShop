class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
