class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_number
      t.integer :prefecture_id
      t.string :city
      t.string :house_number
      t.string :building
      t.string :tel
      t.references :order

      t.timestamps
    end
  end
end
