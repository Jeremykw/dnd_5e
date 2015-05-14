class Cleric < Character
	def saving_throws
		{:wis => ['Wisdom:', ability_modifier(self.ability.wis) + proficency_bonuse ], :char => ['Charisma:', ability_modifier(self.ability.char) + proficency_bonuse ] }
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:history, :medicine, :insight, :religion, :persuasion]
	end
end