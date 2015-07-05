class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :cost
      t.integer :weight
      t.string :details
      t.string :category
      t.integer :ac
      t.boolean :dex_mod
      t.boolean :dex_mod_max
      t.integer :strength
      t.integer :speed
      t.string :damange
      t.string :properties
      t.boolean :ranged

      t.timestamps null: false
    end
  end
end
