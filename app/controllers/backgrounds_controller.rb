class BackgroundsController < ApplicationController	

	before_action :confirm_logged_in
	
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
		params[:new] = 1	
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
		@character = Character.find(character_id_params)
	end

	def update
		@background = Background.find(character_id_params)		
		if @background.update(background_params)
			flash[:notice] = "#{@background.character.character_name} has been updated."
			redirect_to character_path(@background.character.id) and return
		else
			flash[:notice] = @background.errors.full_messages
			redirect_to edit_character_background_path(@background.character, @background) and return
		end
	end

	private

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