class Item < ActiveRecord::Base

	def self.armour
		{
			:padded => { :category => "light", :cost => 5, :ac => 11, :dex_mod => true, :dex_mod_max => false, :stealth => true, :weight => 8 },
			:half_plate => { :name => "Half Plate", :category => "medium", :cost => 750, :ac => 15, :dex_mod => true, :dex_mod_max => 2, :strength => 13, :stealth => true, :weight => 40 }
		}
	end

	def self.weapons
		{
			:club => { :category => "simple", :cost => 0.1, :damage => "1d4 bludgeoning", :weight => 2, :properties => "Light"},
			:crossbow_light => { :name => "Crossbow, light", :category => "simple_ranged", :cost => 25, :damage => "1d8 piercing", :weight => 5, :properties => "Ammunition (range 80/320), loading, two-handed", :ranged => true },
			:longsword => { :category => "martial", :cost => 15, :damage => "1d8 slashing", :weight => 3, :properties => "Versatile (1d10)"},
			:dart => { :category => "simple", :cost => 0.05, :damage => "1d4 piercing", :weight => 0.25, :properties => "Finnesse, thrown (range 20/60)", :ranged => true}
		}
	end

	def self.adventuring_gear
		{
			:abacus => { :cost => 2, :weight => 2}, 
			:chalk => { :cost => 0.001, :weight => false}, 
			:block => { :name => "Block and Tackle", :cost => 2, :weight => 2}, 
			:chest => { :cost => 5, :weight => 25}, 
			:abacus => { :cost => 2, :weight => 2}
		}
	end

	def self.tools
		{
			:alchemist => { :name => "Alchemist's supplies", :cost => 50, :weight => 8, :category => :artisan}
		}
	end
end
