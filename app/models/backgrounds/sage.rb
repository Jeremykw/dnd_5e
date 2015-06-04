class Sage < Background
	def background_skills
		[:arcana, :history]
	end
  def personality_suggestion
    sugestions = {
      1 => "I use polysyllabic words that convey the impression of
great erudition.",
      2 => "I’ve read every book in the world’s greatest libraries—
or I like to boast that I have.",
      3 => "I’m used to helping out those who aren’t as smart
as I am, and I patiently explain anything and
everything to others.",
      4 => "There’s nothing I like more than a good mystery.",
      5 => "I’m willing to listen to every side of an argument before
I make my own judgment.",
      6 => "I . . . speak . . . slowly . . . when talking . . . to idiots, . . .
which . . . almost . . . everyone . . . is . . . compared . . .
to me.",
      7 => "I am horribly, horribly awkward in social situations.",
      8 => "I’m convinced that people are always trying to
steal my secrets."
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Knowledge. The path to power and self-improvement
is through knowledge. (Neutral)",
      2 => "Beauty. What is beautiful points us beyond itself
toward what is true. (Good)",
      3 => "Logic. Emotions must not cloud our logical
thinking. (Lawful)",
      4 => "No Limits. Nothing should fetter the infinite possibility
inherent in all existence. (Chaotic)",
      5 => "Power. Knowledge is the path to power and
domination. (Evil)",
      6 => "Self-Improvement. The goal of a life of study is the
betterment of oneself. (Any)"
    }
    sugestions[rand(1..6)]    
  end

  def bond_suggestion
    sugestions = {
      1 => "It is my duty to protect my students.",
      2 => "I have an ancient text that holds terrible secrets that
must not fall into the wrong hands.",
      3 => "I work to preserve a library, university, scriptorium,
or monastery.",
      4 => "My life’s work is a series of tomes related to a specific
field of lore.",
      5 => "I’ve been searching my whole life for the answer to a
certain question.",
      6 => "I sold my soul for knowledge. I hope to do great deeds
and win it back."  
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "I am easily distracted by the promise of information.",
      2 => "Most people scream and run when they see a demon. I
stop and take notes on its anatomy.",
      3 => "Unlocking an ancient mystery is worth the price of a
civilization.",
      4 => "I overlook obvious solutions in favor of
complicated ones.",
      5 => "I speak without really thinking through my words,
invariably insulting others.",
      6 => "I can’t keep a secret to save my life, or anyone else’s."
    }
    sugestions[rand(1..6)]
  end	
end