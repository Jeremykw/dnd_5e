class Noble < Background
	def background_skills
		[:history, :persuasion]
	end
  def personality_suggestion
    sugestions = {
      1 => "My eloquent flattery makes everyone I talk to feel like the most wonderful and important person in the world.",
      2 => "The common folk love me for my kindness and generosity.",
      3 => "No one could doubt by looking at my regal bearing that I am a cut above the unwashed masses.",
      4 => "I take great pains to always look my best and follow the latest fashions.",
      5 => "I don’t like to get my hands dirty, and I won’t be caught dead in unsuitable accommodations.",
      6 => "Despite my noble birth, I do not place myself above other folk. We all have the same blood.",
      7 => "My favor, once lost, is lost forever.",
      8 => "If you do me an injury, I will crush you, ruin your name, and salt your fields."
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Respect. Respect is due to me because of my position, but all people regardless of station deserve to be treated with dignity. (Good)",
      2 => "Responsibility. It is my duty to respect the authority of those above me, just as those below me must respect mine. (Lawful)",
      3 => "Independence. I must prove that I can handle myself without the coddling of my family. (Chaotic)",
      4 => "Power. If I can attain more power, no one will tell me what to do. (Evil)",
      5 => "Family. Blood runs thicker than water. (Any)",
      6 => "Noble Obligation. It is my duty to protect and care for the people beneath me. (Good)"
    }
    sugestions[rand(1..6)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "I will face any challenge to win the approval of my family.",
      2 => "My house’s alliance with another noble family must be sustained at all costs.",
      3 => "Nothing is more important than the other members of my family.",
      4 => "I am in love with the heir of a family that my family despises.",
      5 => "My loyalty to my sovereign is unwavering.",
      6 => "The common folk must see me as a hero of the people."
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "I secretly believe that everyone is beneath me.",
      2 => "I hide a truly scandalous secret that could ruin my family forever.",
      3 => "I too often hear veiled insults and threats in every word addressed to me, and I’m quick to anger.",
      4 => "I have an insatiable desire for carnal pleasures.",
      5 => "In fact, the world does revolve around me.",
      6 => "By my words and actions, I often bring shame to my family."
    }
    sugestions[rand(1..6)]
  end	
end