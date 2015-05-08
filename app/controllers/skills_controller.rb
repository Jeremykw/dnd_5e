class SkillsController < ApplicationController
	def new
		@character||= Character.find(character_id_params)
		@skill_label = label_skills
	end
	def label_skills
		skill_lab = []
		@character.skill_choices.each do |s|
			skill_lab << skill_label(s)
		end

	end
	# Decodeds Skill symbols 
	def skill_label(sym)
		case sym
		when :acro
			"Acrobatics"
		when :animal
			"Animal"
		when :arcana
			"Arcana"
		when :athletics
			"Athletics"
		when :decept
			"Deception"
		when :hist
			return "History"
		when :insight
			"Insight"
		when :intimidation
			"Intimidation"
		when :invest
			"Investigate"
		when :med
			"Medicine"
		when :nature
			"Nature"
		when :percept
			"Perception"
		when :perform
			"Performance"
		when :persuasion
			"Persuasion"
		when :religion
			"Religion"
		when :slight
			"Slight of Hand"
		when :stealth
			"Steath"
		when :survival
			"Survival"
		end
		"Milk my nuts"
	end

end

