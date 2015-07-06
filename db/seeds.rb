Item.adventuring_gear.each do |item|
	item[:category] = "adventuring_gear" unless item[:category]
	Item.create(item)
end

Item.armour.each do |item|
	Item.create(item)
end

Item.boats.each do |item|
	item[:category] = "boats"
	Item.create(item)
end

Item.mounts.each do |item|
	item[:category] = "mount"
	Item.create(item)
end

Item.tack.each do |item|
	item[:category] = "tack" unless item[:category]
	Item.create(item)
end

Item.tools.each do |item|
	item[:category] = "tool" unless item[:category]
	Item.create(item)
end

Item.weapons.each do |item|
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