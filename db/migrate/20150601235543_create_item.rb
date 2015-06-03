class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.integer :weight
      t.string :properties
      t.integer :cost
      # armour
      t.integer :ac
      t.boolean :dex_mod
      t.boolean :dex_mod_max
      t.integer :str_min
      t.boolean :stealth_disadvantage
      # weapons
      t.integer :damage_min
      t.integer :damage_max
      t.boolean :ranged
      # Vehicle
      t.integer :speed
      t.boolean :waterborne
      # STI
      t.string :catagory

      t.timestamps null: false
    end
  end
end
