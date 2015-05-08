class Fighter < Character
	def saving_throws
			[:str => mod(self.ability.str), :con => mod(self.ability.con)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:acrobatics, :animal_handling, :athletics, :history, :insight, :intimidation, :perception, :survival]
	end
end
