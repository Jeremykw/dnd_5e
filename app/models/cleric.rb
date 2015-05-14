class Cleric < Character
	def saving_throws
		[:wis => ability_modifier(self.ability.wis), :char => ability_modifier(self.ability.char)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:history, :medicine, :insight, :religion, :persuasion]
	end
end