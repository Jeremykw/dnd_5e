class Criminal < Background
	def background_skills
		[:deception, :stealth]
	end

  def personality_suggestion
    sugestions = {
      1 => "I always have a plan for what to do when things go wrong.",
      2 => "I am always calm, no matter what the situation. I never raise my voice or let my emotions control me.",
      3 => "The first thing I do in a new place is note the locations
of everything valuable—or where such things
could be hidden.",
      4 => "I would rather make a new friend than a new enemy.",
      5 => "I am incredibly slow to trust. Those who seem the fairest often have the most to hide.",
      6 => "I don’t pay attention to the risks in a situation. Never tell me the odds.",
      7 => "The best way to get me to do something is to tell me I can’t do it.",
      8 => "I blow up at the slightest insult."
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Honor. I don’t steal from others in the trade. (Lawful)",
      2 => "Freedom. Chains are meant to be broken, as are those who would forge them. (Chaotic)",
      3 => "Charity. I steal from the wealthy so that I can help people in need. (Good)",
      4 => "Greed. I will do whatever it takes to become wealthy. (Evil)",
      5 => "People. I’m loyal to my friends, not to any ideals, and everyone else can take a trip down the Styx for all I care. (Neutral)",
      6 => "Redemption. There’s a spark of good in everyone. (Good)"
    }
    sugestions[rand(1..6)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "I’m trying to pay off an old debt I owe to a generous benefactor.",
      2 => "My ill-gotten gains go to support my family.",
      3 => "Something important was taken from me, and I aim to steal it back.",
      4 => "I will become the greatest thief that ever lived.",
      5 => "I’m guilty of a terrible crime. I hope I can redeem myself for it.",
      6 => "Someone I loved died because of I mistake I made. That will never happen again."
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "When I see something valuable, I can’t think about anything but how to steal it.",
      2 => "When faced with a choice between money and my friends, I usually choose the money.",
      3 => "If there’s a plan, I’ll forget it. If I don’t forget it, I’ll ignore it.",
      4 => "I have a “tell” that reveals when I’m lying.",
      5 => "I turn tail and run when things look bad.",
      6 => "An innocent person is in prison for a crime that I committed. I’m okay with that."
    }
    sugestions[rand(1..6)]
  end	
end