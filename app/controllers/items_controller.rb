class ItemsController < ApplicationController

	def index
		@armour = Item.where("category like ?", 'armour%')
		@weapons = Item.where("category like ?", 'weapon%')
		@adventuring_gear = Item.where("category like ?", 'adventuring_gear%')
		@tools = Item.where("category like ?", 'tool%')
		@boats = Item.where("category like ?", 'boat%')
		@tack = Item.where("category like ?", 'tack%')
		@mounts = Item.where("category like ?", 'mount%')
	end

	def show
		@item = Item.find(id_params	)
	end

	private

	def id_params
		params.require(:id)
	end

end