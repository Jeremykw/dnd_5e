class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item
      t.integer :character_id
      t.integer :quantity
      t.string	:description
      t.string :pack
      t.timestamps null: false
    end
  end
end
