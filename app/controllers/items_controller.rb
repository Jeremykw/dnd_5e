class ItemsController < ApplicationController

	def index
		armour = Item.armour.group_by { |t| t[:category] }
		@armour = {"light" => armour["light_armour"], "medium" => armour["medium_armour"], "heavy" => armour["heavy_armour"]}
		@weapons = Item.weapons.group_by { |t| t[:category] }
		@adventuring_gear = Item.adventuring_gear
		@tools = Item.tools
		@boats = Item.boats.sort_by { |hsh| hsh[:name] }
		@tack = Item.tack
		@mounts = Item.mounts
	end

end