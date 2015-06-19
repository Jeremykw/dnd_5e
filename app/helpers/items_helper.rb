module ItemsHelper

	# Item fields not to be show in tabel format in show
	def a_field_not_to_be_show
		[ "pack", "id", "action", "controller", "details", "dex_mod_max", "dex_mod", "character_id", "stealth", "strength", "ac"]
	end
	# Generates a link to items/show wtih item name
	def item_name_to_link(item, character) 
		item[:character_id] = character.id
		render_haml(link_to "#{item[:name]}", item_path(item))
	end

	def items(character)
		@items = @character.item.items_list
	end

	def best_armour_character_has(character, items)
		all_armour = items.find_all { |item| item[:type] == "armour" || item[:id] == 212}
		best_ac = 0
		best_armour = nil
		all_armour.each do |armour|
			ac = calculate_ac(character, armour)
			if  ac > best_ac
				best_ac = ac
				best_armour = armour
			end
		end
		best_armour
	end

	def calculate_ac(character, item)
		dex_modifier = character.ability_modifier(character.ability[:dex])
		logger.debug "dex_modifier = #{dex_modifier}"
		dex_modifier += character.proficency_bonuse if character.saving_throws.include?(:dex)
		if item == nil
			ac = dex_modifier + 10
		else
			ac = calculate_ac_with_armour(dex_modifier, item)			
		end
	end

	def calculate_ac_with_armour(dex_modifier, armour)
		if armour[:dex_mod_max] == true
			calculate_ac_with_dex_mod_with_max(dex_modifier)
		elsif armour[:dex_mod]
			ac = armour[:ac].to_i + dex_modifier
		else
			ac = armour[:ac]
		end
	end

	def calculate_ac_with_dex_mod_with_max(dex_modifier)
		if dex_modifier >= 2
			ac = item[:ac] + 2
		else
			ac = item[:ac] + dex_modifier
		end
	end

	def character_is_wearing_armour?(items)
		if number_of_items = items.find { |item| item[:type] == "armour" }
			return true
		else
			return false
		end
	end

	def display_armour_class(armour) # Formats ac, dex_mod and dex_mod_max into string for display
		ac = armour[:ac].to_s
		if armour[:dex_mod]
			ac += " + Dex modifier"
		elsif armour[:id] == 212 || armour[:name] == "Shield"
			ac = "Armour class + 2"
		else
			ac += " + no modifier"
		end
		if armour[:dex_mod_max]
			ac += " (max #{armour[:dex_mod_max]})"
		end
		ac
	end

	def cost_converter(gold) # Converts gold decimal into sp and cp
		case
		when gold.is_a?(String)
			cost = gold
		when gold >= 1
			cost = "#{gold} gp"
		when gold < 1 && gold >= 0.1
			cost = "#{(gold * 10).to_i} sp"
		when gold < 0.1
			cost = "#{(gold * 100).to_i} cp"
		end
		cost
	end



	def weight(lb) # Adds lb onto weight
		if !lb || lb == 0
			"---" 
		elsif lb.is_a? Integer
			"#{lb} lb"
		elsif lb.is_a? Float
			"#{lb} lb" 
		else
			lb
		end
	end

	def categorize_items(items)
		items.group_by do |t| 
			if t[:category]
				t[:category]
			else
				t[:name]
			end
		end
	end

	def simple_weapons # Creates and array of all simple weapons
		Item.weapons.find_all{ |hash| hash[:category] == "simple_melee"}
	end

	def martial_weapon
		Item.weapons.find_all{ |hash| hash[:category] == "martial_melee"}
	end
	
end
