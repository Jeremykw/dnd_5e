module SkillsHelper

	def show_skills_array(character)
		skills = skill_choices(character) + background_skills(character)
		skills.sort
	end

	def skill_choices(character)
		if character.skill # Hash with skill ability dependancy; Skill.rb
			skill_ability = character.skill.skill_ability 
		end
		skills = []
		character.skill.attributes.each do |skill, tf|
			if tf == true
				skills << "#{skill.to_s.humanize.capitalize}(#{skill_ability[skill][0].to_s}): #{skill_ability[skill][1].to_s}"
			end
		end
		skills
	end

	def background_skills(character)
		if character.skill # Hash with skill ability dependancy; Skill.rb
			skill_ability = character.skill.skill_ability
		end
		skills = []
		character.background.background_skills.each do |s|
			skills << "#{s.to_s.humanize.capitalize}(#{skill_ability[s.to_s][0]}:) #{skill_ability[s.to_s][1]}"
		end
		skills
	end

	
end