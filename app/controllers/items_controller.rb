class ItemsController < ApplicationController

	def index
		@armour = Item.armour
		@weapons = Item.weapons
		@adventuring_gear = Item.adventuring_gear
		@tools = Item.tools
		@vehicles = Item.vehicles
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