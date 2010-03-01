class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :code
      t.string :description
      t.decimal :price
    end
  end

  def self.down
    drop_table :products
  end
end
