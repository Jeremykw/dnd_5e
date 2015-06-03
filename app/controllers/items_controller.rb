class ItemsController < ApplicationController
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.valid?
			@item.save
			flash[:notice] = "#{@item.item} has been created!"
			redirect_to items_path and return
		else 
			flash[:notice] = "Item was not sucsessfully created!"
			redirect_to new_item_path(@item) and return
		end
	end

	def index
		@armour = Item.where(:catagory => 'armour')
		@weapons = Item.where(:catagory => 'weapon')
		@gear = Item.where(:catagory => 'gear')
		@tools = Item.where(:catagory => 'tool')
		@vehicle = Item.where(:catagory => 'vehicle')
		@mounts = Item.where(:catagory => 'mounts')
	end

	private

	def item_params
		params.require(:item).permit(:catagory, :item, :weight, :properties, :cost, :ac, :str_min, :dex_mod, :dex_mod_max, :stealth_disadvantage, :damage_min, :damage_max, :ranged, :speed)
	end

end