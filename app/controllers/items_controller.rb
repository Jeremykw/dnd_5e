class ItemsController < ApplicationController

	def index
		@armour = Item.where('category', '^armour')
		@weapons = Item.where('category', )
		@adventuring_gear = Item.where('category', )
		@tools = Item.where('category', )
		@boats = Item.where('category', )
		@tack = Item.where('category', )
		@mounts = Item.where('category', )
	end

end