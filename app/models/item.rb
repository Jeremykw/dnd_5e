class Item < ActiveRecord::Base

  belongs_to :character

  validates :item, :presence => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 206 }
  validates :description, :allow_blank => true, :length => { :maximum => 250 }
  validates :character_id, :presence => true, :numericality => { :only_integer => true }
  validates :quantity, :allow_blank => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 100 }



  Dir['app/models/items/*.rb'].each {|file| require_dependency file }
	extend ArmourList
	extend WeaponsList
	extend AdventureingGearList
	extend ToolsList
	extend BoatsList
	extend MountsList
	extend TackList
  extend PackCreation

  ###
  # Returns an array of hashes with all items
  # and their details that belong to a character
  ###
  def self.items
    item_numbers = []
    items = []
    # finds all item ids belonging to character and creates an 
    # array with its item number
    i = self.all
    i.each do |e|
      item_numbers << e.item
    end
    # Creates an array with the hash of info related to the item
    item_numbers.each do |n|
      # TODO #
      # add details of non catalog items
      items << list.find { |h| h[:id] == n }
    end
    items
  end

  ###
  # Iterates through all items submitted in params and 
  # calls create_item for that item
  ##
  def self.create_starting_items(character, item_choices) 
    item_choices.each do |k, choice|
      create_item(character, choice)
    end    
  end

  private
  # returns a master list of all items
  def self.list
    armour + weapons + adventuring_gear + tools + boats + tack + mounts
  end

  # Creates item or redirects to add_unlisted_item
  def self.create_item(character, item)
    item = item.to_i
    if item <= 206 && item > 0 # if item is a cataloged numbered item create it 
      create(:character_id => character.id, :item => item)
    else # else reffer to add_unlisted_items find in /items/pack_creation.rb
      add_unlisted_items(character, item)
    end
  end
  
end