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
  extend PackCreation


  # Returns list of all items
  def self.items
    item_numbers = []
    items = []
    i = self.all
    i.each do |e|
      item_numbers << e.item
    end
    item_numbers.each do |n|
      items << list.find { |h| h[:id] == n }
    end
    items
  end

  def self.create_starting_items(character, item_choices) 
    item_choices.each do |k, choice|
      create_item(character, choice)
    end    
  end

  private

  def self.list
    armour + weapons + adventuring_gear + tools + boats + tack + mounts
  end

  def self.create_item(character, item)
    item = item.to_i
    if item <= 206 && item > 0
      create(:character_id => character.id, :item => item)
    else
      add_unlisted_items(character, item)
    end
  end
  
end