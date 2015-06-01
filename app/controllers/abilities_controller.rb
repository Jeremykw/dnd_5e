class AbilitiesController < ApplicationController	
	
		before_action :confirm_logged_in
		before_action :confirm_user_posession_of_character, :except => [:index, :new, :create, :update]
	
	def create
		@character = Character.find(character_id_params)	
		if @character.create_ability(ability_params).invalid?
			flash[:notice] = "#{@character.character_name}'s six statistics must be numbers between 3 and 20"
			redirect_to new_character_ability_path(@character.id)
		else
			redirect_to new_character_skill_path(@character)
		end
	end

	def new				
		if !@character = Character.find(character_id_params) # Redirect to indext if character not found
			flash[:notice] = "Charcter record does not exits"
			redirect_to character_index_path and return
		end		
		@recomended_ability = view_context.recomended_abilities(@character.character_class) # Ability sujestions based on class
		params[:new_ability] = 1
	end

	def edit
		if @character = Character.find(character_id_params)
			@recomended_ability = view_context.load_abilities(@character.ability)
		end	
	end

	def update
		@ability= Ability.find(id_params)		
		if @ability.update(ability_params)
			flash[:notice] = "#{@ability.character.character_name} has been updated."
			redirect_to character_path(@ability.character.id) and return
		else
			flash[:notice] = @ability.errors.full_messages
			redirect_to edit_character_ability_path(@ability.character, @ability) and return
		end
	end

	private

	def confirm_user_posession_of_character
		if Ability.exists?(id_params)
			@ability = Ability.find(id_params)
			if @ability.character.user_id != session[:authorized_user_id]
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
	def id_params
		params.require(:id)
	end
	
	def character_id_params
		params.require(:character_id)
	end
	
	def ability_params
		params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char, :id)
	end
end

