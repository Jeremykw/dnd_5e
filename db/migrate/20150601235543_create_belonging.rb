class CreateBelonging < ActiveRecord::Migration
  def change
    create_table :belongings do |t|
      t.integer :item
      t.integer :character_id
      t.integer :quantity
      t.string	:description
      t.string :pack
      t.timestamps null: false
    end
  end
end
