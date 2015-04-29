class AddSubraceToCharacter < ActiveRecord::Migration
  def up
    add_column :characters, :subrace, :string
  end
  def down
  	remoce column :character, :subrace
  end
end
