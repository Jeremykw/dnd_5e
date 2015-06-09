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

  def self.create_starting_items(char, items_choices)
    items_choices.each do |k, choice|
      starting_items(choice).each do |i|
        char.item.build(:item => i).save

      end
    end
  end

  private

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

