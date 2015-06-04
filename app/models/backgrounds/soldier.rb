class Soldier < Background
	def background_skills
		[:athletics, :intimidation]
	end
  def personality_suggestion
    sugestions = {
      1 => "I’m always polite and respectful.",
      2 => "I’m haunted by memories of war. I can’t get the images
of violence out of my mind.",
      3 => "I’ve lost too many friends, and I’m slow to
make new ones.",
      4 => "I’m full of inspiring and cautionary tales from
my military experience relevant to almost every
combat situation.",
      5 => "I can stare down a hell hound without flinching.",
      6 => "I enjoy being strong and like breaking things.",
      7 => "I have a crude sense of humor.",
      8 => "I face problems head-on. A simple, direct solution is
the best path to success."
    }
    sugestions[rand(1..8)]
  end

  def ideal_suggestion
    sugestions = {
      1 => "Greater Good. Our lot is to lay down our lives in
defense of others. (Good)",
      2 => "Responsibility. I do what I must and obey just
authority. (Lawful)",
      3 => "Independence. When people follow orders blindly, they
embrace a kind of tyranny. (Chaotic)",
      4 => "Might. In life as in war, the stronger force wins. (Evil)",
      5 => "Live and Let Live. Ideals aren’t worth killing over or
going to war for. (Neutral)",
      6 => "Nation. My city, nation, or people are all that
matter. (Any)"
    }
    sugestions[rand(1..6)]
  end

  def bond_suggestion
    sugestions = {
      1 => "I would still lay down my life for the people I
served with.",
      2 => "Someone saved my life on the battlefield. To this day, I
will never leave a friend behind.",
      3 => "My honor is my life.",
      4 => "I’ll never forget the crushing defeat my company
suffered or the enemies who dealt it.",
      5 => "Those who fight beside me are those worth dying for.",
      6 => "I fight for those who cannot fight for themselves."
    }
    sugestions[rand(1..6)]
  end

  def flaw_suggestion
    sugestions = {
      1 => "The monstrous enemy we faced in battle still leaves
me quivering with fear.",
      2 => "I have little respect for anyone who is not a
proven warrior.",
      3 => "I made a terrible mistake in battle that cost many
lives—and I would do anything to keep that
mistake secret.",
      4 => "My hatred of my enemies is blind and unreasoning.",
      5 => "I obey the law, even if the law causes misery.",
      6 => "I’d rather eat my armor than admit when I’m wrong."
    }
    sugestions[rand(1..6)]
  end	
end