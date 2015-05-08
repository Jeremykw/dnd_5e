class Wizard < Character
	def saving_throws
			[:int => mod(self.ability.int), :wis => mod(self.ability.wis)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:arcana, :deception, :history, :insight, :investigation, :medicine, :religion]
	end
end