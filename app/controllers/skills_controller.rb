class SkillsController < ApplicationController
	def new
		@character ||= Character.find(character_id_params)
		@skill_choices = @character.skill_choices - @character.background.background_skills
		@skills_chose = []
	end
	
	def create
		@character = Character.find(character_id_params)
		if @character.create_skill(skill_params).invalid?
			flash[:notice] = "You must chose #{@character.number_of_skill} Skills!"
			@character.skill.set_all_skills_to_nil
			redirect_to new_character_skill_path(@character) and return
		end
			redirect_to new_character_background_path(@character)
		else
	end

	def edit
		if @character = Character.find(character_id_params)		
			if @character.skill
				@skill_choices = @character.skill_choices - @character.background.background_skills
				@skills_chose = @character.skill.load_skill_choices
			end
		end	
	end

	def update
		if @skill= Skill.find(id_params)
			set_skills_to_nil_and_save(@skill)
		end
	end

	private

	###
	# skills would not save unselected skills as unselected
	# setting all to nil prior to updating new skills solved this
	###
	def set_skills_to_nil_and_save(skill)
		if skill
			skill.set_all_skills_to_nil
			if !skill.update_attributes(skill_params)
				# flash[:notice] = @character.errors[:skill]
				flash[:notice] = "You mush chose #{skill.character.number_of_skill} skills!"
				redirect_to edit_character_skill_path(skill.character, skill) and return
			else
				flash[:notice] = "#{@skill.character.character_name} has been updated."
				redirect_to character_path(@skill.character) and return
			end
		end
	end


	###
	# Stong Params
	###
	def id_params
		params.require(:id)
	end
	def skill_params
		params.require(:skill).permit(:acrobatics, :animal_handling, :arcana, :athletics, :deception, :history, :insight, :intimidation, :investigation, :medicine, :nature, :perception, :perforamance, :persuasion, :religion, :sleight_of_hand, :stealth, :survival) if params[:skill]
	end
	
	def character_id_params
		params.require(:character_id)
	end

end

