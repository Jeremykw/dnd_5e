module ItemsHelper
	###
	# compares previous and next from sorted list of items 
	# and returns true of false depending if category name 
	# needs to be printed to screen
	###
	def category_needs_lable(items, category_name, index)
		unless items[index + 1] == nil
			next_index = index + 1 
		else
			next_index = index
		end
		unless items[index - 1] == nil
			last_index = index - 1 
		else
			last_index = index
		end
		if !items[index + 1] 
			return false 
		elsif category_name == items[next_index][:name] && category_name != items[last_index][:name]
			return true
		else
			false
		end
	end

	###
	# compares previous and next from sorted list of items 
	# and returns true of false if item belongs to a category 
	###
	def item_is_part_of_category(items, category_name, index)
		unless items[index + 1] == nil
			next_index = index + 1 
		else
			next_index = index
		end
		unless items[index - 1] == nil
			last_index = index - 1 
		else
			last_index = index
		end
		if !items[index + 1] 
			return false 
		elsif category_name == items[next_index][:name] || category_name == items[last_index][:name]
			return true
		else
			false
		end
	end

	def items_with_categories(items)
		categories = []
		items.each do |item|
			if item.category != "adventuring_gear"
				categories << {:item => item, :name => "#{item.category.split(/ /)[1]}" }
			else
				categories << {:item => item, :name => "#{item.name.downcase}"}
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