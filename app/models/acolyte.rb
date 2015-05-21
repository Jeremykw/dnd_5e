class Acolyte < Background
	
	def background_skills
		[:insight, :religion]
	end

  def personality_suggestion
    sugestions = {
      1 => "I idolize a particular hero of my faith, and constantly refer to that person’s deeds and example.",
      2 => "I can find common ground between the fiercest enemies, empathizing with them and always working toward peace.",
      3 => "I see omens in every event and action. The gods try to speak to us, we just need to listen",
      4 => "Nothing can shake my optimistic attitude.",
      5 => "I quote (or misquote) sacred texts and proverbs in almost every situation.",
      6 => "I am tolerant (or intolerant) of other faiths and respect (or condemn) the worship of other gods.",
      7 => "I’ve enjoyed fine food, drink, and high society among my temple’s elite. Rough living grates on me.",
      8 => "I’ve spent so long in the temple that I have little practical experience dealing with people in the outside world."
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Tradition. The ancient traditions of worship and sacrifice must be preserved and upheld. (Lawful)",
      2 => "Charity. I always try to help those in need, no matter what the personal cost. (Good)",
      3 => "Change. We must help bring about the changes the gods are constantly working in the world. (Chaotic)",
      4 => "Power. I hope to one day rise to the top of my faith’s religious hierarchy. (Lawful)",
      5 => "Faith. I trust that my deity will guide my actions. I have faith that if I work hard, things will go well. (Lawful)",
      6 => "Aspiration. I seek to prove myself worthy of my god’s favor by matching my actions against his or her teachings. (Any)"
    }
    sugestions[rand(1..6)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "I would die to recover an ancient relic of my faith that was lost long ago.",
      2 => "I will someday get revenge on the corrupt temple hierarchy who branded me a heretic.",
      3 => "I owe my life to the priest who took me in when my parents died.",
      4 => "Everything I do is for the common people.",
      5 => "I will do anything to protect the temple where I served.",
      6 => "I seek to preserve a sacred text that my enemies consider heretical and seek to destroy."      
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "I judge others harshly, and myself even more severely.",
      2 => "I put too much trust in those who wield power within my temple’s hierarchy.",
      3 => "My piety sometimes leads me to blindly trust those that profess faith in my god.",
      4 => "I am inflexible in my thinking.",
      5 => "I am suspicious of strangers and expect the worst of them.",
      6 => "Once I pick a goal, I become obsessed with it to the detriment of everything else in my life."      
    }
    sugestions[rand(1..6)]
  end
end