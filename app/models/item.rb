class Item < ActiveRecord::Base
  belongs_to :belonging

  Dir['app/models/items/*.rb'].each {|file| require_dependency file }
  extend ArmourList
  extend WeaponsList
  extend AdventureingGearList
  extend ToolsList
  extend BoatsList
  extend MountsList
  extend TackList
  extend WeaponDetails
  extend ArmourDetails
  extend GearDetails
  

end
