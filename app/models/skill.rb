class Skill < ActiveRecord::Base
	belongs_to :character

	def update_skill
		@skill_choices = load_skill_choices
		self.attributes.map do |s|
			if @skill_choices.include?(s)
				self.s = true
			else
				self.s = false
			end
		end
		self.save
	end
		# If skills have been saved; Load
	def load_skill_choices
		skill_choices = []
		self.attributes.each do |skill, tf|
			skill_choices << skill if tf === true
		end
		skill_choices
	end
end