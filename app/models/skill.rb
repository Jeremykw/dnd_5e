class Skill < ActiveRecord::Base
	belongs_to :character
	validate :correct_number_of_skills

	def correct_number_of_skills
		@character = Character.find(self.character_id)
		number_of_skills = @character.number_of_skill
		if skill_list.reject(&:blank?).size != number_of_skills
	    errors.add(:skill, "Make sure you have chosen #{number_of_skills} skills before saving.")
	  end
	end

	def skill_list
		list = [self.acrobatics, self.animal_handling, self.arcana, self.athletics, self.deception, self.history, self.insight, self.intimidation, self.investigation, self.medicine, self.nature, self.perception, self.performance, self.persuasion, self.religion, self.sleight_of_hand, self.stealth, self.survival]
	end
	
	###
	# Set all attributes to nil so that on update
	# unchecked skills get saved as unchecked
	###
	def set_all_skills_to_nil	
	  self.acrobatics = nil
	  self.animal_handling = nil
	  self.arcana = nil
	  self.athletics = nil
	  self.deception = nil
	  self.history = nil
	  self.insight = nil
	  self.intimidation = nil
	  self.investigation = nil
	  self.medicine = nil
	  self.nature = nil
	  self.perception = nil
	  self.performance = nil
	  self.persuasion = nil
	  self.religion = nil
	  self.sleight_of_hand = nil
	  self.stealth = nil
	  self.survival = nil  
	end
	###
	# Creates array of saved skills for Character#Edit
	###
	def load_skill_choices
		skill_choices = []
		self.attributes.each do |skill, tf|
			skill_choices << skill if tf === true
		end
		skill_choices
	end
	###
	# Hash keyed with skill ability dependancy
	###
	def skill_ability
		@character = Character.find(self.character_id)
		skill_ability = {
			"acrobatics" => [:dex, (calculate_skill_modifier("acrobatics", :dex)) ],
			"animal_handling" => [ :wis, (calculate_skill_modifier("animal_handling", :wis)) ],
			"arcana" => [ :int, (calculate_skill_modifier("arcana", :int)) ],
			"athletics" => [ :str, (calculate_skill_modifier("athletics", :str)) ],
			"deception" => [ :char, (calculate_skill_modifier("deception", :char)) ],
			"history" => [ :int, (calculate_skill_modifier("history", :int)) ],
			"insight" => [ :wis, (calculate_skill_modifier("insight", :wis)) ],
			"intimidation" => [ :char, (calculate_skill_modifier("intimidation", :char)) ],
			"investigation" => [ :int, (calculate_skill_modifier("investigation", :int)) ],
			"medicine" => [ :wis, (calculate_skill_modifier("medicine", :wis)) ],
			"nature" => [ :int, (calculate_skill_modifier("nature", :int)) ],
			"perception" => [ :wis, (calculate_skill_modifier("perception", :wis)) ],
			"performance" => [ :char, (calculate_skill_modifier("performance", :char)) ],
			"persuasion" => [ :char, (calculate_skill_modifier("persuasion", :char)) ],
			"religion" => [ :int, (calculate_skill_modifier("religion", :int)) ],
			"sleight_of_hand" => [ :dex, (calculate_skill_modifier("sleight_of_hand", :dex)) ],
			"stealth" => [ :dex, (calculate_skill_modifier("stealth", :dex)) ],
			"survival" => [ :wis, (calculate_skill_modifier("survival", :wis)) ]
		}
	end
	def calculate_skill_modifier(skill, dependant_ability)

		modifier = @character.ability_modifier(@character.ability[dependant_ability])
		if @character.skill.load_skill_choices.include?(skill)
			modifier = modifier + @character.proficency_bonuse
		end
		modifier
	end
end