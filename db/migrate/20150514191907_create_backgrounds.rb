class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.text :personality
      t.text :ideal
      t.text :bond
      t.text :flaw
      t.text :back_story
      t.string :type

      t.timestamps null: false
    end
  end
end