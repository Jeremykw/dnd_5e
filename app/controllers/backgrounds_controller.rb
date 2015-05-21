class BackgroundsController < ApplicationController	
	
	def show

	end
	
	def create
		@character = Character.find(character_id_params)
		if !@character.background.update(background_params)
			flash[:notice] = "Please#{@character.character_name.pluralize} Background"
			redirect_to new_character_background_path(@character.id) and return
		end
		redirect_to character_path(@character)

	end

	def new		
		# Redirect to index if character not found
		if !@character = Character.find(character_id_params)
			flash[:notice] = "Charcter record does not exits"
			redirect_to character_index_path
		end
		if @character.skill # Hash with skill ability dependancy; Skill.rb
			@skill_ability = @character.skill.skill_ability 
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	###
	# Strong Params
	###
	def background_params
		params.require(:background).permit(:personality, :ideal, :bond, :flaw, :back_story)
	end

	def character_id_params
		params.require(:character_id)
	end

end