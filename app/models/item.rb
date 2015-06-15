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
  extend ItemsHelper


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

  def self.create_starting_items(character, item_choices)
    item_choices.each do |k, choice|
      create_item(character, choice)
    end    
  end

  private

  def self.list
    Item.armour + Item.weapons + Item.adventuring_gear + Item.tools + Item.boats + Item.tack + Item.mounts
  end

  def self.create_item(character, item)
    item = item.to_i
    if item <= 206 && item > 0
      Item.create(:character_id => character.id, :item => item)
    else
      add_unlisted_items(character, item)
    end
  end
  
  def self.add_unlisted_items(character, equipment_choice)
    case equipment_choice
    when 300 # Prayer Book
      item = Item.create(:character_id => character.id, :item => 72, :description => "Prayer book")
    when 301 # prayer wheel
      item = Item.create(:character_id => character.id, :item => 206, :description => "Prayer wheel")
    when 330 # light crosbow, 20 bolts
      Item.create(:character_id => character.id, :item => 14)
      Item.create(:character_id => character.id, :item => 57)
    when 331 # two handaxe
      Item.create(:character_id => character.id, :item => 19)
      Item.create(:character_id => character.id, :item => 19)
    when 332 # Leather longbow 20 arrows
      Item.create(:character_id => character.id, :item => 2)
      Item.create(:character_id => character.id, :item => 48)
      Item.create(:character_id => character.id, :item => 55)
    when 333
      Item.create(:character_id => character.id, :item => 26)
      Item.create(:character_id => character.id, :item => 55)
    when 350 # priests pack
      create_pack(character, priests_pack)
    when 351 # explorers pack
      create_pack(character, explorers_pack)
    when 352 # dungenereers pack
      create_pack(character, dungenereers_pack)
    when 353
      create_pack(character, burglars_pack)
    when 354
      create_pack(character, scholars_pack(character))
    when 355
      create_pack(character, diplomats_pack)
    end
  end

  def self.create_pack(character, pack)
    pack.each do |item, quantity|
      Item.create(:character_id => character.id, :item => item, :quantity => quantity)
    end
  end

  def self.burglars_pack
    # TODO #
    # 10 feet of string
    [[65, 1], [66, 1], [70, 1], [205, 5], [85, 1], [92, 1], [118, 10], [107, 1], [113, 2], [126, 5], [140, 1], [143, 1], [129, 1]]
  end
  
  def self.diplomats_pack
    [[78, 2], [52, 1], [82, 1], [101, 1], [102, 1], [105, 1], [113, 2], [114, 5], [116, 1], [132, 1], [135, 1]]
  end

  def self.dungenereers_pack
    [[65, 1], [85, 1], [92, 1], [118, 10], [141, 10], [140, 0], [126, 10], [143, 1], [128, 1]]
  end

  def self.entertainers_pack
    [[65, 1], [69, 1], [81, 2], [205, 5], [126, 5], [143, 1], [162, 1]]
  end

  def self.explorers_pack
    [[65, 1], [69, 1], [111, 1], [140, 1], [141, 10], [126, 10], [143, 1], [128, 1]]
  end

  def self.priests_pack
    # TODO #
    item = Item.create(:character_id => character.id, :item => 206, :description => "Alms box")
    item = Item.create(:character_id => character.id, :item => 206, :description => "2 Blocks incense")
    item = Item.create(:character_id => character.id, :item => 206, :description => "Censer")
    item = Item.create(:character_id => character.id, :item => 206, :description => "Vestments")
    [[65, 1], [71, 1], [205, 10], [140, 1], [126, 2], [143, 1]]
  end

  def self.scholars_pack(character)
    # TODO #
    item = Item.create(:character_id => character.id, :item => 72, :description => "Book of lore")
    item = Item.create(:character_id => character.id, :item => 206, :description => "Little bar of sand")
    item = Item.create(:character_id => character.id, :item => 206, :description => "Small knife")
    [[65, 1], [101, 1], [102, 1], [115, 10]]
  end

end