class CreateCharacters < ActiveRecord::Migration[4.2]
  def up
    create_table :characters do |c|
			c.string 'character_name'
  		c.string 'character_class'
  		c.integer 'level'
  		c.string 'past'
  		c.string 'player_name'
  		c.string 'race_subrace'
      c.string 'race'
      c.string 'subrace'
  		c.string 'alignment'
  		c.integer 'xp'
  		c.string 'type' # For single table inheratance of Character_class
      c.integer 'user_id'
  		c.timestamp 'created_at'
    end
  end
  def down
  	drop_table :characters
  end
end



