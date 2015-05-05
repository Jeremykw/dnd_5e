class CharactersController < ApplicationController

	def index
		@characters = Character.all
		#raise @characters.inspect
		#@characters.sort_by!{|name| name.character_name.downcase}

	end

	def show
		if Character.exists?(id_params)
			@character = Character.find(id_params)
		else
			flash[:notice] = "Sorry, record does not exist"
			redirect_to character_index_path
		end
		params[:show] = 1 #indicating if routing from Character Show
	end

	def edit
		@character = Character.find(id_params)
		@recomended_ability = Ability.abilities_array(@character) 
		params[:edit] = 1
	end

	def update
		@character = Character.find(id_params)
		@ability = Ability.find_by_character_id(id_params)
		@character.update(character_params)
		@ability.update(ability_params)
		if @character.character_name
			flash[:notice] = "#{character_params[:character_name]} has been updated."
		else
			flash[:notice] = "Character has been updated."
		end
		redirect_to character_path(id_params)
	end

	def new
		params[:new] = 1
	end

	def create
		@character = character_params
		# Save character based on class
		save_by_class		
		redirect_to new_character_ability_path(@character.id)
	end

	def destroy
		@character = Character.find(id_params)
		@character.destroy
		flash[:notice] = "#{@character.character_name} has been destroyed!"
		redirect_to characters_path
	end


	# Check Prams to determin class
	def character_class
		if character_params
			@character_class = character_params[:character_class]
		else
			@character_class = @character.character_class
		end
	end

	def save_by_class
		case character_class
		when "fighter"
			@character = Fighter.create!(@character)
		when "cleric"
			@character = Cleric.create!(@character)
		when "rouge"
			@character = Rouge.create!(@character)
		when "wizard"
			@character = Wizard.create!(@character)
		end
	end
end