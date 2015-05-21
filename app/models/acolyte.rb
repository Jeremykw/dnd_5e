class Acolyte < Background
	def background_skills
		[:insight, :religion]
	end

  def personality_suggestion
    sugestions = {
      1 => "I idolize a hero of my faith.",
      2 => "I can find common ground with an enemie",
      3 => "I see omens in every event"
    }
    sugestions[rand(1..3)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "I must worship",
      2 => "I always try to be helpful",
      3 => "I trust my god"
    }
    sugestions[rand(1..3)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "I would die for my faith",
      2 => "I owe my life to a priest",
      3 => "I will do anything to protect my temple"
    }
    sugestions[rand(1..3)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "I judge others",
      2 => "Im inflexable in my thinking",
      3 => "I become obsesive with my goals"
    }
    sugestions[rand(1..3)]
  end
end