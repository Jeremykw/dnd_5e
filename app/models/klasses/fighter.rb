class Fighter < Character
	def saving_throws
			{:str => ["Strength:", ability_modifier(self.ability.str) + proficency_bonuse ], :con => ['Constitution:', ability_modifier(self.ability.con) + proficency_bonuse ]}
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:acrobatics, :animal_handling, :athletics, :history, :insight, :intimidation, :perception, :survival]
	end
end
