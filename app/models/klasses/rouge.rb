class Rouge < Character
	def saving_throws
		{:dex => ["Dexterity:", ability_modifier(self.ability.dex) + proficency_bonuse ], :int => ['Intelligence:', ability_modifier(self.ability.int) + proficency_bonuse ]}
	end

	def number_of_skill
		4
	end

	def skill_choices
				[:acrobatics, :athletics, :deception, :insight, :intimidation, :investigation, :perception, :performance, :persuasion, :sleight_of_hand, :stealth]
	end
end