class Belonging < ActiveRecord::Base

  belongs_to :item
  belongs_to :character

  validates :item_id, :presence => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 212 }
  validates :description, :allow_blank => true, :length => { :maximum => 250 }
  validates :character_id, :presence => true, :numericality => { :only_integer => true }
  validates :quantity, :allow_blank => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 100 }



  Dir['app/models/belongings/*.rb'].each {|file| require_dependency file }
  extend PackCreation

  ###
  # Returns an array of hashes with all items
  # and their details that belong to a character
  ###
  def self.items_list
    equipment_list = self.all
    add_item_details(equipment_list)
  end

  ###
  # Iterates through all items submitted in params and 
  # calls create_item for that item
  ##
  def self.create_starting_items(character, item_choices)
    non_option_starting_equipment(character)
    item_choices.each do |k, choice|
      create_item(character, choice)
    end  
  end

  def self.remove_belonings(items, character)
    items.each do |item_id, v|
      find(item_id).destroy
    end
  end
  private

  
  # Creates item or redirects to add_unlisted_item
  def self.create_item(character, item)
    item = item.to_i
    if item <= 212 && item >= 1 # if item is a cataloged numbered item create it 
      create(:character_id => character.id, :item => Item.find(item))
    else # else reffer to add_unlisted_items find in /items/pack_creation.rb
      add_unlisted_items(character, item)
    end
  end
  
  # Returns item type based on :id number
  def self.item_type(item)
    if item[:id] >= 1 && item[:id] <= 13
      "armour"
    elsif item[:id] >= 14 && item[:id] <= 49
      "weapon"
    elsif item[:id] >= 50 && item[:id] <= 147
      "gear"
    elsif item[:id] >= 148 && item[:id] <= 184
      "tool"
    elsif item[:id] >= 185 && item[:id] <= 192
      "mount"
    elsif item[:id] >= 193 && item[:id] <= 206
      "tack"
    elsif item[:id] >= 207 && item[:id] <= 212
      "boat"
    end
  end
end