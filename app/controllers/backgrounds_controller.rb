class BackgroundsController < ApplicationController	

	before_action :confirm_logged_in
	before_action :confirm_user_posession_of_character, :except => [:index, :new, :create, :update]
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
		# if @character.skill # Hash with skill background dependancy; Skill.rb
		# 	@skill_background = @character.skill.background_skills 
		# end
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

	def confirm_user_posession_of_character
		if Background.exists?(id_params)
			@background = Background.find(id_params)
			if @background.character.user_id != session[:authorized_user_id]
				flash[:notice] = "Incorrect Character ID, Permission denied"
				redirect_to characters_path
			else
				true
			end
		else
			flash[:notice] = "Character does not exist"
			redirect_to characters_path
		end
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

	def id_params
		params.require(:id)
	end

end