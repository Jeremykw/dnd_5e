module ItemsHelper
	def display_armour_class(armour)
		ac = armour[:ac].to_s
		if armour[:dex_mod]
			ac += " + Dex modifier"
		end
		if armour[:dex_mod_max]
			ac += " (max #{armour[:dex_mod_max]})"
		end
		ac
	end

	def cost_converter(gold)
		case
		when gold >= 1
			cost = "#{gold} gp"
		when gold < 1 && gold >= 0.1
			cost = "#{(gold * 10).to_i} sp"
		when gold < 0.1
			cost = "#{(gold * 100).to_i} cp"
		end
		cost
	end

	def name(k, v)

		if v[:name]
			link_to "#{v[:name]}", item_path()
		else
			link_to "#{k.to_s.capitalize}", item_path()
		end
	end

	def weight(lb)
		if !lb 
			"---" 
		else 
			"#{lb} lb" 
		end
	end
end