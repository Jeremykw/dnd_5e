class CreateSkills < ActiveRecord::Migration[4.2]
  def change
    create_table :skills do |t|
      t.boolean :acrobatics
      t.boolean :animal_handling
      t.boolean :arcana
      t.boolean :athletics
      t.boolean :deception
      t.boolean :history
      t.boolean :insight
      t.boolean :intimidation
      t.boolean :investigation
      t.boolean :medicine
      t.boolean :nature
      t.boolean :perception
      t.boolean :performance
      t.boolean :persuasion
      t.boolean :religion
      t.boolean :sleight_of_hand
      t.boolean :stealth
      t.boolean :survival
      t.integer :character_id
    end
  end
end
