class Skill < ActiveRecord::Base

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
	def self.skill_ability
		skill_ability = {
			"acrobatics" => :dex,
			"animal_handling" => :wis,
			"arcana" => :int,
			"athletics" => :str,
			"deception" => :char,
			"history" => :int,
			"insight" => :wis,
			"intimidation" => :char,
			"investigation" => :int,
			"medicine" => :wis,
			"nature" => :int,
			"perception" => :wis,
			"performance" => :char,
			"persuasion" => :char,
			"religion" => :int,
			"sleight_of_hand" => :dex,
			"stealth" => :dex,
			"survival" => :wis,
		}
	end

end