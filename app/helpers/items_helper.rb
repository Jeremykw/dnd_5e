module ItemsHelper

	def items_with_categories(items)
		categories = []
		# item_list = items.sort_by { |i| i.name || i.category}
		items.each do |item|
			if item.category != "adventuring_gear"
				categories << {:id => item.id, :name => "#{item.category.split(/ /)[1]}" }
			else
				categories << {:id => item.id, :name => "#{item.name.downcase}"}
			end
		end
		categories.sort_by! {|item| item[:name]}
	end

	def armour_categories(armour_list)
		light = []
		medium = []
		heavy = []
		armour_list.each do |a|
			case a.category
			when "armour, light_armour"
				light << a
			when "armour, medium_armour"
				medium << a
			when "armour, heavy_armour"
				heavy << a
			end
		end
		light.sort_by! { |a| a.name}
		medium.sort_by! { |a| a.name}
		heavy.sort_by! { |a| a.name}
		armour = light + medium + heavy
	end

	def weapon_categories(weapon_list)
		simple_ranged = []
		simple_melee = []
		martial_melee = []
		martial_ranged = []
		weapon_list.each do |a|
			case a.category
			when "weapon, simple_melee"
				simple_melee << a
			when "weapon, simple_ranged"
				simple_ranged << a
			when "weapon, martial_melee"
				martial_melee << a
			when "weapon, martial_ranged"
				martial_ranged << a
			end
		end
		simple_melee.sort_by! { |a| a.name}
		simple_ranged.sort_by! { |a| a.name}
		martial_melee.sort_by! { |a| a.name}
		martial_ranged.sort_by! { |a| a.name}
		armour = simple_melee + simple_ranged + martial_melee + martial_ranged
	end


end