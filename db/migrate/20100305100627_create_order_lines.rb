class CreateOrderLines < ActiveRecord::Migration
  def self.up
    create_table :order_lines do |t|
      t.timestamps
      t.integer :order_id, :product_id, :quantity
    end
  end

  def self.down
    drop_table :order_lines
  end
end
