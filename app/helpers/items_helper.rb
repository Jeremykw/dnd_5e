module ItemsHelper

	def display_armour_class(armour) # Formats ac, dex_mod and dex_mod_max into string for display
		ac = armour[:ac].to_s
		if armour[:dex_mod]
			ac += " + Dex modifier"
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

	def name(k, v) # Formats equipment name into link
		### TODO ###
		if v[:name]
			link_to "#{v[:name]}", item_path(k, :item => v)
		else
			link_to "#{k.to_s.capitalize}", item_path(k, :item => v, :name => k)
		end
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
	
end
