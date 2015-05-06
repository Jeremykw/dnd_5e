class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.boolean :acro
      t.boolean :animal
      t.boolean :arcana
      t.boolean :Athletics
      t.boolean :Decept
      t.boolean :hist
      t.boolean :insight
      t.boolean :intimidation
      t.boolean :invest
      t.boolean :med
      t.boolean :nature
      t.boolean :percept
      t.boolean :perform
      t.boolean :persuasion
      t.boolean :religion
      t.boolean :sleight
      t.boolean :stealth
      t.boolean :survial
    end
  end
end
