class Rouge < Character
	def saving_throws
		[:dex => ability_modifier(self.ability.dex), :int => ability_modifier(self.ability.int)]
	end

	def number_of_skill
		4
	end

	def skill_choices
				[:acrobatics, :athletics, :deception, :insight, :intimidation, :investigation, :perception, :performance, :persuasion, :sleight_of_hand, :stealth]
	end
end