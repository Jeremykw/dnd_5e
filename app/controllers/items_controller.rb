class ItemsController < ApplicationController


	def starting_equipment
		@character = Character.find(id_params)
	end

	def create
		logger.debug "class_items_choices_four = #{items_choices_params}"

		character = Character.find(id_params)
		if new_starting_items(character)
			new_items = Item.create_starting_items(character, items_choices_params)
		end
		redirect_to character_path(character)
	end


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

	def new_starting_items(character)
		!character.starting_items
	end

	def items_choices_params
		params.require(:items_choices).permit!#(:background_items_choices_one, :background_items_choices_two, :class_items_choices_one, :class_items_choices_two, :class_items_choices_three, :class_items_choices_four, :class_items_choices_five, array: items_choices_permits.keys)
	end

	def items_choices_permits
		permits = {}
		for n in 27..44
			permits.merge("class_items_choices_#{n}".parameterize.underscore.to_sym => true)
		end
		permits
	end

	def item_params
		params.require(:item).permit(:catagory, :item, :weight, :properties, :cost, :ac, :str_min, :dex_mod, :dex_mod_max, :stealth_disadvantage, :damage_min, :damage_max, :ranged, :speed)
	end

	def id_params
		params.require(:id)
	end	

end