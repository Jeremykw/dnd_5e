class ItemsController < ApplicationController

	def index
		armour = Item.armour.group_by { |t| t[:category] }
		@armour = {"light" => armour["light"], "medium" => armour["medium"], "heavy" => armour["heavy"]}
		@weapons = Item.weapons.group_by { |t| t[:category] }
		@adventuring_gear = Item.adventuring_gear
		@tools = Item.tools
		@boats = Item.boats.sort_by { |hsh| hsh[:name] }
		@tack = Item.tack
		@mounts = Item.mounts
	end

	def show
		@item = params
	end

	private

	def item_params
		params.require(:item).permit(:catagory, :item, :weight, :properties, :cost, :ac, :str_min, :dex_mod, :dex_mod_max, :stealth_disadvantage, :damage_min, :damage_max, :ranged, :speed)
	end

	

end