class Skill < ActiveRecord::Base
#	validate :correct_number_of_skills

	def correct_number_of_skills

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

end