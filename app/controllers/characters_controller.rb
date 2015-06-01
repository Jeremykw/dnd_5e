class CharactersController < ApplicationController

	before_action :confirm_logged_in
	before_action :confirm_user_posession_of_character, :except => [:index, :new, :create, :update]

	def index 
		@characters = Character.where(user_id:  session[:authorized_user_id])
	end

	def show
		if Character.exists?(id_params)
			@character = Character.find(id_params)
		else
			flash[:notice] = "Sorry, record does not exist"
			redirect_to characters_path
		end
		params[:show] = 1 #indicating if routing from Character Show
	end

	def edit
		@character = Character.find(id_params) if Character.exists?(id_params)
		params[:edit] = 1
	end

	def update
		@character = Character.find(id_params)
		
		if @character.update(character_params)
			flash[:notice] = "#{character_params[:character_name]} has been updated."
			redirect_to character_path(id_params) and return
		else
			flash[:notice] = @character.errors.full_messages
			redirect_to edit_character_path(@character)
		end
		
	end

	def new
		params[:new] = 1
	end

	def create
		@character = Character.create_character(character_params, session[:authorized_user_id]) # Save character based on class

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
		if @character.destroy
			flash[:notice] = "#{@character.character_name} has been destroyed!"
			redirect_to characters_path
		end
	end

	private

	def confirm_user_posession_of_character
		if Character.exists?(id_params)
			@character = Character.find(id_params)
			if @character.user_id != session[:authorized_user_id]
				flash[:notice] = "Incorect Character ID, please try again"
				redirect_to characters_path
			else
				true
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