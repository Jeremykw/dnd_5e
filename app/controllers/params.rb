# attr_assasable :character
def character_params
	params.require(:character).permit(:character_id, :character_name, :character_class, :level, :background, :player_name, :race, :alignment, :xp, :subrace)
end

def id_params
	params.require(:id)
end

# attr_assasable :character

def character_id_params
	params.require(:character_id)
end

