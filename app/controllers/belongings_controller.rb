class BelongingsController < ApplicationController

	before_action :correct_number_of_martial_weapons_for_fighter, only: :create

	def destroy
		if remove_item_params
			@character = Character.find(character_id_params)
			Belonging.remove_belonings(remove_item_params, @character)
		end
		redirect_to edit_character_belonging_path(character_id_params, 1)
	end

	def edit
		@character = Character.find(character_id_params)
	end

	def starting_equipment
		@character = Character.find(character_id_params)
	end

	def create		
		character = Character.find(id_params) 
		if starting_items_params
			if new_starting_items(character)
				Belonging.create_starting_items(character, items_choices_params)
				character.update_attributes(:starting_items => true)
				# character.save
			else
				flash[:notice] = "You have saved your starting equipment already."
			end
		end
		redirect_to character_path(character)
	end

	def show
		@character = Character.find(character_id_params)
		@belonging = @character.belongings.where("item_id like ?", id_params)[0]
		@item = Item.find(id_params)
	end

	private

	def correct_number_of_martial_weapons_for_fighter
    character = Character.find(id_params)
    if character.character_class == "fighter" && new_starting_items(character)
      count = 0
      items_choices_params.each do |k, item|
      	count += 1 if item.to_i >= 13 && item.to_i <= 49
      end
      if count != 2
      	flash[:notice] = "You must select 2 Martial weapons"
      	redirect_to starting_equipment_belonging_path(character) and return
      end
    end
  end

	def new_starting_items(character)
		!character.starting_items
	end

	###
	# Strong Parameters White List
	###

	def remove_item_params
		params.require(:remove_item).permit!
	end

	def items_choices_params
		params.require(:items_choices).permit!#(:background_items_choices_one, :background_items_choices_two, :class_items_choices_one, :class_items_choices_two, :class_items_choices_three, :class_items_choices_four, :class_items_choices_five, array: items_choices_permits.keys)
	end

	def item_params
		params.require(:item).permit(:catagory, :item, :weight, :properties, :cost, :ac, :str_min, :dex_mod, :dex_mod_max, :stealth_disadvantage, :damage_min, :damage_max, :ranged, :speed)
	end

	def id_params
		params.require(:id)
	end	

	def starting_items_params
		params.require(:starting_items)
	end

	def character_id_params
		params.require(:character_id)
	end

end