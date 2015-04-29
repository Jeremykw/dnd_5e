class CharactersController < ApplicationController
	require "params.rb"

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
		params[:edit] = 1
	end

	def update
		Character.update(id_params, character_params)
		flash[:notice] = "#{character_params[:character_name]} has been updated."
		redirect_to character_path(id_params)
	end

	def new
		params[:new] = 1
	end

	def create
		@character = character_params
		# Seperate race into race/subrace
		race_subrace
		# Save character based on class
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
		redirect_to new_character_ability_path(@character.id)

	end

	def destroy
		@character = Character.find(id_params)
		@character.destroy
		flash[:notice] = "#{@character.character_name} has been destroyed!"
		redirect_to character_index_path
	end
end

# Check Prams to determin class
def character_class
	if character_params
		@character_class = character_params[:character_class]
	else
		@character_class = @character.character_class
	end
	@character_class
end

# Check Params to find the race
def race_subrace # Seperates race into :race and :subrace
	
	race = character_params[:race]
	case race
	when 'dwarf_hill'
		@character[:race] = "dwarf"
		@character[:subrace] = "hill"
	when 'dwarf_mountain'
		@character[:race] = "dwarf"
		@character[:subrace] = "mountain"
	when 'elf_high'
		@character[:race] = "elf"
		@character[:subrace] = "high"
	when 'elf_wood'
		@character[:race] = "elf"
		@character[:subrace] = "wood"
	when 'halfling_lightfoot'
		@character[:race] = "halfling"
		@character[:subrace] = "lightfoot"
	when 'halfling_stout'
		@character[:race] = "halfling"
		@character[:subrace] = "stout"
	end
end