class FolkHero < Background
	def background_skills
		[:animal_handling, :survival]
	end

	  def personality_suggestion
    sugestions = {
      1 => "I judge people by their actions, not their words.",
      2 => "If someone is in trouble, I’m always ready to lend help.",
      3 => "When I set my mind to something, I follow through no matter what gets in my way.",
      4 => "I have a strong sense of fair play and always try to find the most equitable solution to arguments.",
      5 => "I’m confident in my own abilities and do what I can to instill confidence in others.",
      6 => "Thinking is for other people. I prefer action.",
      7 => "I misuse long words in an attempt to sound smarter.",
      8 => "I get bored easily. When am I going to get on with my destiny?"
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Respect. People deserve to be treated with dignity and respect. (Good)",
      2 => "Fairness. No one should get preferential treatment before the law, and no one is above the law. (Lawful)",
      3 => "Freedom. Tyrants must not be allowed to oppress the people. (Chaotic)",
      4 => "Might. If I become strong, I can take what I want what I deserve. (Evil)",
      5 => "Sincerity. There’s no good in pretending to be something I’m not. (Neutral)",
      6 => "Destiny. Nothing and no one can steer me away from my higher calling. (Any)"
    }
    sugestions[rand(1..6)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "I have a family, but I have no idea where they are. One day, I hope to see them again.",
      2 => "I worked the land, I love the land, and I will protect the land.",
      3 => "A proud noble once gave me a horrible beating, and I will take my revenge on any bully I encounter.",
      4 => "My tools are symbols of my past life, and I carry them so that I will never forget my roots.",
      5 => "I protect those who cannot protect themselves.",
      6 => "I wish my childhood sweetheart had come with me to pursue my destiny."
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "The tyrant who rules my land will stop at nothing to see me killed.",
      2 => "I’m convinced of the significance of my destiny, and blind to my shortcomings and the risk of failure.",
      3 => "The people who knew me when I was young know my shameful secret, so I can never go home again.",
      4 => "I have a weakness for the vices of the city, especially hard drink.",
      5 => "Secretly, I believe that things would be better if I were a tyrant lording over the land.",
      6 => "I have trouble trusting in my allies."      
    }
    sugestions[rand(1..6)]
  end	
end