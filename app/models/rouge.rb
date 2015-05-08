class Rouge < Character
	def saving_throws
		[:dex => mod(self.ability.dex), :int => mod(self.ability.int)]
	end

	def number_of_skill
		4
	end

	def skill_choices
				[:acrobatics, :athletics, :deception, :insight, :intimidation, :investigation, :perception, :performance, :persuasion, :sleight_of_hand, :stealth]
	end
end