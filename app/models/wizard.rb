class Wizard < Character
	def saving_throws
			[:int => ability_modifier(self.ability.int), :wis => ability_modifier(self.ability.wis)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:arcana, :deception, :history, :insight, :investigation, :medicine, :religion]
	end
end