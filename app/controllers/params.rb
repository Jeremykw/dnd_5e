###
# Strong Parameters
###

def ability_params
	params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char)
end

def character_id_params
	params.require(:character_id)
end

def character_params
	params.require(:character).permit(:character_id, :character_name, :character_class, :level, :background, :player_name, :race, :alignment, :xp, :subrace)
end

def id_params
	params.require(:id)
end

def character_id_params
	params.require(:character_id)
end



