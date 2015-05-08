class Wizard < Character
	def saving_throws
			["strength" => mod(self.ability.str), :con => mod(self.ability.con)]
	end

	def number_of_skill
		2
	end

	def skill_choices
		[:acro => "Acrobatics", :animal => "Animal Handeling", :athletics => "Athletics", :hist => "History", :insight => "Insight", :intimidation => "Intimidation", :percept => "Perception", :survival => "Survival"]
	end
end