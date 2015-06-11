module ArmourList
	def armour
		[
			{ :id => 1,   :name => "Padded", :category => "light", :cost => 5, :ac => 11, :dex_mod => true, :dex_mod_max => false, :stealth => true, :weight => 8 },
			{ :id => 2,   :name => "Leather", :category => "light", :cost => 10, :ac => 11, :dex_mod => true, :dex_mod_max => false, :stealth => false, :weight => 10 },
			{ :id => 3,   :name => "Studded Leather", :category => "light", :cost => 12, :ac => 12, :dex_mod => true, :dex_mod_max => false, :stealth => false, :weight => 13,},
			{ :id => 4,   :name => "Chain Shirt", :category => "medium", :cost => 50, :ac => 13, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 20 },
			{ :id => 5,   :name => "Hide", :category => "medium", :cost => 10, :ac => 12, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 12 },
			{ :id => 6, 	:name => "Scale Mail", :category => "medium", :cost => 50, :ac => 14, :dex_mod => true, :dex_mod_max => 2, :stealth => true, :weight => 45 },
			{ :id => 7,   :name => "Breastplate",  :category => "medium", :cost => 400, :ac => 14, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 20 },			
			{ :id => 8,   :name => "Half Plate", :category => "medium", :cost => 750, :ac => 15, :dex_mod => true, :dex_mod_max => 2, :stealth => true, :weight => 40 },
			{ :id => 9,   :name => "Ring mail",  :category => "heavy", :cost => 30, :ac => 14, :dex_mod => false, :dex_mod_max => false, :strength => 13, :stealth => true, :weight => 40 },
			{ :id => 10,  :name => "Chain Mail", :category => "heavy", :cost => 75, :ac => 16, :dex_mod => false, :dex_mod_max => false, :strength => 13, :stealth => true, :weight => 55 },
			{ :id => 11,  :name => "Splint", :category => "heavy", :cost => 200, :ac => 17, :dex_mod => false, :dex_mod_max => false, :strength => 15, :stealth => true, :weight => 60 },
			{ :id => 12,  :name => "Plate", :category => "heavy", :cost => 1500, :ac => 18, :dex_mod => false, :dex_mod_max => false, :strength => 15, :stealth => true, :weight => 65 },
			{ :id => 204, :name => "Shield", :category => "shield", :cost => 10, :ac => 2, :dex_mod => false, :dex_mod_max => false, :strength => false, :stealth => false, :weight => 6 },
		]
	end
end