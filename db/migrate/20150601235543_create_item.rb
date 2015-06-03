class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.integer :character_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
