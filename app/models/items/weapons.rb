module WeaponsList
	def weapons
		{
			:club => { :category => "simple", :cost => 0.1, :damage => "1d4 bludgeoning", :weight => 2, :properties => "Light"},
			:crossbow_light => { :name => "Crossbow, light", :category => "simple_ranged", :cost => 25, :damage => "1d8 piercing", :weight => 5, :properties => "Ammunition (range 80/320), loading, two-handed", :ranged => true },
			:longsword => { :category => "martial", :cost => 15, :damage => "1d8 slashing", :weight => 3, :properties => "Versatile (1d10)"},
			:dart => { :category => "simple", :cost => 0.05, :damage => "1d4 piercing", :weight => 0.25, :properties => "Finnesse, thrown (range 20/60)", :ranged => true}
		}
	end
end