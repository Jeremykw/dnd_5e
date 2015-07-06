Dir['db/equipment_seeds/*.rb'].each {|file| require_dependency file }
extend ArmourList
extend WeaponsList
extend AdventureingGearList
extend ToolsList
extend BoatsList
extend MountsList
extend TackList
extend WeaponDetails
extend ArmourDetails
extend GearDetails

adventuring_gear.each do |item|
	if item[:category]
		item[:category] = "adventuring_gear, #{item[:category]}"
	else
		item[:category] = "adventuring_gear"
	end	
	Item.create(item)
end

armour.each do |item|
	item[:category] = "armour, #{item[:category]}"
	Item.create(item)
end

boats.each do |item|
	item[:category] = "boats"
	Item.create(item)
end

mounts.each do |item|
	item[:category] = "mount"
	Item.create(item)
end

tack.each do |item|
	if item[:category]
		item[:category] = "tack, #{item[:category]}"
	else
		item[:category] = "tack"
	end	
	Item.create(item)
end

tools.each do |item|
	if item[:category]
		item[:category] = "tools, #{item[:category]}"
	else
		item[:category] = "adventuring_gear"
	end	
	Item.create(item)
end

weapons.each do |item|
	item[:category] = "weapon, #{item[:category]}"
	Item.create(item)
end


# Character.create!(
# 		:character_name => "Ella", 
# 		:character_class => "Wizard", 
# 		:level => 5, 
# 		:background => "sage",
# 		:player_name => "Rowan Bissonnette",
# 		:race => "elf", 
# 		:alignment => "Lawful Good",
# 		:xp => 7000
# 	)
# Character.create!(
# 		:character_name => "Griffen", 
# 		:character_class => "Theif", 
# 		:level => 5, 
# 		:background => "Noble",
# 		:player_name => "Breanne Bissonnette",
# 		:race => "elf", 
# 		:alignment => "Lawful Good",
# 		:xp => 7100
# 	)
# Character.create!(
# 		:character_name => "Hazelton", 
# 		:character_class => "Druid", 
# 		:level => 5, 
# 		:background => "sage",
# 		:player_name => "Karen Cooke",
# 		:race => "elf", 
# 		:alignment => "Lawful Good",
# 		:xp => 7200
# 	)