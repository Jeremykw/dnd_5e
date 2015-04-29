class CreateAbilities < ActiveRecord::Migration
  def up
  	create_table 'abilities' do |a|
  		a.integer "str"
  		a.integer "dex"
  		a.integer "con"
  		a.integer "int"
  		a.integer "wis"
  		a.integer "char"
  		a.integer "character_id"
  		a.timestamps
  	end
  end

  def down
  	drop_table 'abilities'
  end
end
