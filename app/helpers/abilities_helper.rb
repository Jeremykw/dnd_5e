module AbilitiesHelper

  def new_ability_suggestions(klass)
    case klass
    when "cleric"
      "As a Cleric, you want Wisdom to be your highest score followed by Strength or Constitution."
    when "fighter"
      "As a Fighter, you want Strength or Dexterity to be your highest score, depending on whether you want to focus on melee or on archery. Your next highest score should be Constitution."
    when "rouge"
      "As a Rouge, you want Dexterity to be your highest score. Make Intelligence your next-highest if you want to excel at Investigation, or Charisma instead if you plan to emphasize deception and social interaction."
    when "wizard"
      "As a Wizard, Intelligence should be you highest score, followed by Constitution or Dexterity."
    end
  end

  def racial_ability_notice(character)
    if character.race == "human"
    "As a Human you will automaticaly get +1 to all your ability scores, on save."
    else
      "As a #{character.subrace.capitalize} #{character.race.capitalize} you will automaticaly get #{racial_ability_modifier_notice(character.subrace)}, on save."
    end
  end

    ###
  # Generates ability modifier Notice
  ###
  def racial_ability_modifier_notice(subrace)
    case subrace
    when "mountain"
      " +2 to strenght and +2 to constitution"
    when "hill"
      " +1 to strenght and +2 to constitution"
    when "high"
      " +2 to dexterity and +1 to intelligence"
    when "wood"
      " +2 to dexterity and +1 to wisdom"
    when "lightfoot"
      " +1 charisma"
    when "stout"
      " +1 constitution"
    when nil # Human, does not have a sub class
      " +1 to all abilities"
    end
  end
end