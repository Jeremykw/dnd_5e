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
		
		# if @character.skill
		# 	@skill_choices = @character.skill_choices - @character.background.background_skills
		# 	@skills_chose = @character.skill.load_skill_choices
		# end
		params[:edit] = 1
	end

	def update
		@character = Character.find(id_params)
		@character.update(character_params)
		# @character.ability.update(ability_params)
		# set_skills_to_nil_and_save
		if @character.character_name
			flash[:notice] = "#{character_params[:character_name]} has been updated."
		else
			flash[:notice] = "Character has been updated."
		end
		redirect_to character_path(id_params) and return
	end

	def new
		params[:new] = 1
	end

	def create
		@character = Character.create_character(character_params) # Save character based on class
		if @character.invalid?
			flash[:notice] = @character.errors.full_messages
			redirect_to new_character_path(@character) and return
		else
			Background.create_background(@character)			
			redirect_to new_character_ability_path(@character.id)
		end

	end

	def destroy
		@character = Character.find(id_params)
		@character.destroy
		flash[:notice] = "#{@character.character_name} has been destroyed!"
		redirect_to characters_path
	end

	###
	# skills would not save unselected skills as unselected
	# setting all to nil prior to updating new skills solved this
	###
	def set_skills_to_nil_and_save
		if @character.skill
			@character.skill.set_all_skills_to_nil
			if !@character.skill.update_attributes(skill_params)
				# flash[:notice] = @character.errors[:skill]
				flash[:notice] = "You mush chose #{@character.number_of_skill} skills!"
				redirect_to edit_character_path(@character) and return
			end
		end
	end

###
# Strong Params
###
	def skill_params
		if params[:skill]
			params.require(:skill).permit(:acrobatics, :animal_handling, :arcana, :athletics, :deception, :history, :insight, :intimidation, :investigation, :medicine, :nature, :perception, :perforamance, :persuasion, :religion, :sleight_of_hand, :stealth, :survival) 
			end
	end

	def character_id_params
		params.require(:character_id)
	end

	def character_params
		params.require(:character).permit(:character_id, :character_name, :character_class, :level, :past, :player_name, :race, :alignment, :xp, :subrace, :race_subrace)
	end

	def id_params
		params.require(:id)
	end

	def ability_params
		params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char)
	end	

end