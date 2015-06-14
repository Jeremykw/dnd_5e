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
    logger.debug"equipment_choice = #{equipment_choice}"
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
      Item.create(:character_id => character_id, :item => 2)
      Item.create(:character_id => character.id, :item => 48)
      Item.create(:character_id => character.id, :item => 55)
    when 350 # priests pack
      create_pack(priests_pack)
    when 351 # explorers pack
      create_pack(explorers_pack)
    when 352 # dungenereers pack
  end

  def self.create_pack(pack)
    pack.each do |item, quantity|
      Item.create(:character_id => character.id, :item => item, :quantity => quantity)
    end
  end

  def self.burglars_pack

  end
  
  def self.diplomats_pack

  end

  def self.dungenereers_pack

  end

  def entertainers_pack

  end

  def self.explorers_pack
    [[69, 1], [111, 1], [140, 1], [141, 10], [126, 10], [144, 1]]
  end

  def self.priests_pack
    # TODO #
    # alms box
    # 2 blocks incencs
    # censer
    # vestment
    [[71, 1], [205, 10], [140, 1], [126, 2], [143, 1]]
  end

  def self.scholars_pack

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

