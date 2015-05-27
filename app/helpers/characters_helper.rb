module CharactersHelper
	###
	# Lists of choices for character#new select boxes and validation
	###
	CLASS_CHOICE_LIST = [['Fighter', 'fighter'], ['Cleric', 'cleric'], ['Rouge', 'rouge'], ['Wizard', 'wizard']]
	RACE_CHOICE_LIST = [['Dwarf, Hill', 'dwarf_hill'], ['Dwarf, Mountain', 'dwarf_mountain'], ['Elf, High', 'elf_high'], ['Elf, Wood', 'elf_wood'], ['Halfling, Lightfoot', 'halfling_lightfoot'], ['Halfling, Stout', 'halfling_stout'], ['Human', 'human'] ]
	ALIGNMENT_CHOICE_LIST = [['Lawful good', 'lg'], ['Neutral good', 'ng'], ['Chaotic good', 'cg'], ['Lawful neutral', 'ln'], ['Neutral', 'n'], ['Chaotic neutral', 'cn'], ['Lawful evil', 'le'], ['Neutral evil', 'ne'], ['Chaotic evil', 'ce']]
	BACKGROUND_CHOICE_LIST = [['Acolyte', 'acolyte'], ['Criminal', 'criminal'], ['Folk Hero', 'folk_hero'], ['Noble', 'noble'], ['Sage', 'sage'], ['Soldier', 'soldier']]


	def race(character) # full race exp: Hill Dwarf
		if character.race == 'human'
			"#{character.race.capitalize}"
		else
			"#{character.subrace.capitalize} #{character.race.capitalize}"
		end
	end

	# Decodes alignment abreviation into Full Message for Character#show
	def show_alignment(alignment)
		align = ""
		ALIGNMENT_CHOICE_LIST.each do |a, b|
			align = a if b == alignment
		end
		align
	end

	def character_title(character)
		if character.character_name.blank?
		  "Character Details"
		elsif character
		  "#{@character.character_name}'s Details"
		end
	end

end
