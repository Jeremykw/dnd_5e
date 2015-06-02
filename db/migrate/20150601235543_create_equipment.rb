class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :weight
      t.string :properties
      t.integer :cost
      # armour
      t.integer :ac
      t.boolean :dex_mod
      t.boolean :dex_max
      t.boolean :stealth
      # weapons
      t.integer :damage_min
      t.integer :damage_max
      t.boolean :ranged
      # Vehicle
      t.integer :speed
      # STI
      t.string :type


      t.timestamps null: false
    end
  end
end
