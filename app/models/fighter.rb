class Fighter < Character
	def saving_throws
			[:str => ability_modifier(self.ability.str), :con => ability_modifier(self.ability.con)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:acrobatics, :animal_handling, :athletics, :history, :insight, :intimidation, :perception, :survival]
	end
end
