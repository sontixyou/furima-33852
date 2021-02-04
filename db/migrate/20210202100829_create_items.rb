class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :detail
      t.integer :condition_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :delivery_day_id
      t.integer :category_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
