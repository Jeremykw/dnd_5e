class Item < ActiveRecord::Base

  belongs_to :character

	Dir['app/models/items/*.rb'].each {|file| require_dependency file }
	extend ArmourList
	extend WeaponsList
	extend AdventureingGearList
	extend ToolsList
	extend BoatsList
	extend MountsList
	extend TackList

  def self.create_starting_items(character, background_choices, class_choices)
    background_choices.each do |k, choice|
      choice = choice.to_i
      if choice <= 240 && choice > 0
        Item.create(:character_id => character.id, :item => choice)
      else
        add_background_options(character, choice)
      end
    end    
  end



  # Returns list of all items
  def self.items
  	item_numbers = []
  	items = []
  	list = Item.list
  	i = self.all
  	i.each do |e|
  		item_numbers << e.item
  	end
  	item_numbers.each do |n|
  		items << list.find { |h| h[:id] == n }
  	end
  	items
  end

  private
  
  def self.list
    Item.armour + Item.weapons + Item.adventuring_gear + Item.tools + Item.boats + Item.tack + Item.mounts
  end

  def self.add_background_options(character, equipment_choice)
    logger.debug"equipment_choice = #{equipment_choice}"
    case equipment_choice
    when 300
      item = Item.create(:character_id => character.id, :item => 72, :description => "Prayer book")
    when 301
      item = Item.create(:character_id => character.id, :item => 241, :description => "Prayer wheel")
    end
      
  end

  def self.starting_items(choice)
    case choice
    when "acolyte_1"
      [1,2,3]
    when "acolyte_2"
      [4,5,6]
    when "acolyte_3"
      [7,8,9]
    when "acolyte_4"
      [10, 11, 12]
    end
  end

end

