module PackCreation
	###
	# Any items options not listed as standared items in the Hand Book
	# get created here, explicedly 
  ###
  def add_unlisted_items(character, equipment_choice)
    case equipment_choice
    when 300 # Prayer Book
      character.belongings.create(:character_id => character.id, :item_id => 72, :description => "Prayer book")
    when 301 # prayer wheel
      character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Prayer wheel")
    when 302 # broken blade
      character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Broken Blade")
    when 303 # Piece of banner
      character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Piece of banner")
    when 330 # light crosbow, 20 bolts
      character.belongings.create(:character_id => character.id, :item_id => 14)
      character.belongings.create(:character_id => character.id, :item_id => 57)
    when 331 # two handaxe
      character.belongings.create(:character_id => character.id, :item_id => 19)
      character.belongings.create(:character_id => character.id, :item_id => 19)
    when 332 # Leather longbow 20 arrows
      character.belongings.create(:character_id => character.id, :item_id => 2)
      character.belongings.create(:character_id => character.id, :item_id => 48)
      character.belongings.create(:character_id => character.id, :item_id => 55)
    when 333
      character.belongings.create(:character_id => character.id, :item_id => 26)
      character.belongings.create(:character_id => character.id, :item_id => 55)
    when 350 # priests pack
      create_pack(character, priests_pack(character), "priests_pack")
    when 351 # explorers pack
      create_pack(character, explorers_pack(character), "explorers_pack")
    when 352 # dungenereers pack
      create_pack(character, dungenereers_pack(character), "dungenereers_pack")
    when 353
      create_pack(character, burglars_pack(character), "burglars_pack")
    when 354
      create_pack(character, scholars_pack(character), "scholars_pack")
    when 355
      create_pack(character, diplomats_pack(character), "diplomats_pack")
    end
  end

  def non_option_starting_equipment(character)
    case character.character_class
    when "rouge"
      character.belongings.create(:character_id => character.id, :item_id => 2)
      character.belongings.create(:character_id => character.id, :item_id => 17, :quantity => 2)
      character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Theives tools")
    when "fighter"

    when "cleric"
      character.belongings.create(:character_id => character.id, :item_id => 21)
    when "wizard"

    end
  end

  # Creates each item in the array returned from *_pack methods below
  def create_pack(character, pack, pack_type)
    pack.each do |item, quantity|
      character.belongings.create(:character_id => character.id, :item_id => item, :quantity => quantity, :pack => pack_type)
    end
  end

	###
	# Explicedly creates any non standared items before returning
	# an array of arrays with items and corresponding quantity 
	###
	def burglars_pack(character)
    character.belongings.create(:character_id => character.id, :item_id => 20, :description => "10 Feet of string", :pack => "burglars_pack")
    [[65, 1], [66, 1], [70, 1], [210, 5], [85, 1], [92, 1], [118, 10], [107, 1], [113, 2], [126, 5], [140, 1], [143, 1], [129, 1]]
  end
  
  def diplomats_pack(character)
    [[78, 2], [52, 1], [82, 1], [101, 1], [102, 1], [105, 1], [113, 2], [114, 5], [116, 1], [132, 1], [135, 1]]
  end

  def dungenereers_pack(character)
    [[65, 1], [85, 1], [92, 1], [118, 10], [141, 10], [140, 0], [126, 10], [143, 1], [128, 1]]
  end

  def entertainers_pack(character)
    [[65, 1], [69, 1], [81, 2], [205, 5], [126, 5], [143, 1], [162, 1]]
  end

  def explorers_pack(character)
    [[65, 1], [69, 1], [111, 1], [140, 1], [141, 10], [126, 10], [143, 1], [128, 1]]
  end

  def priests_pack(character)
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Alms box", :pack => "priests_pack")
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "2 Blocks incense", :pack => "priests_pack")
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Censer", :pack => "priests_pack")
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Vestments", :pack => "priests_pack")
    [[65, 1], [71, 1], [210, 10], [140, 1], [126, 2], [143, 1]]
  end

  def scholars_pack(character)
    character.belongings.create(:character_id => character.id, :item_id => 72, :description => "Book of lore", :pack => "scholars_pack")
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Little bar of sand", :pack => "scholars_pack")
    character.belongings.create(:character_id => character.id, :item_id => 21, :description => "Small knife", :pack => "scholars_pack")
    [[65, 1], [101, 1], [102, 1], [115, 10]]
  end

end