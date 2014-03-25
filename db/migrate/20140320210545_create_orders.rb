class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.string :payment_method
      t.string :shipping_address
      t.string :shipping_city
      t.string :customer_name
      t.string :customer_lastname

      t.timestamps
    end
  end
end
