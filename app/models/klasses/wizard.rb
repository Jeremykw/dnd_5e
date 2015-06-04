class Wizard < Character
	def saving_throws
			{:int => ['Intellienece:', ability_modifier(self.ability.int) + proficency_bonuse ], :wis => ['Wisdom:', ability_modifier(self.ability.wis) + proficency_bonuse ]}
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:arcana, :deception, :history, :insight, :investigation, :medicine, :religion]
	end
end