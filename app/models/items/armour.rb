module ArmourList
	def armour
		[
			{ :id => 1,   :name => "Padded", :details => [padded], :category => "light", :cost => 5, :ac => 11, :dex_mod => true, :dex_mod_max => nil, :stealth => true, :weight => 8 },
			{ :id => 2,   :name => "Leather", :details => [leather], :category => "light", :cost => 10, :ac => 11, :dex_mod => true, :dex_mod_max => nil, :stealth => false, :weight => 10 },
			{ :id => 3,   :name => "Studded Leather", :details => [studded_leather], :category => "light", :cost => 12, :ac => 12, :dex_mod => true, :dex_mod_max => nil, :stealth => false, :weight => 13,},
			{ :id => 4,   :name => "Chain Shirt", :details => [chain_shirt], :category => "medium", :cost => 50, :ac => 13, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 20 },
			{ :id => 5,   :name => "Hide", :details => [hide], :category => "medium", :cost => 10, :ac => 12, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 12 },
			{ :id => 6, 	:name => "Scale Mail", :details => [scale], :category => "medium", :cost => 50, :ac => 14, :dex_mod => true, :dex_mod_max => 2, :stealth => true, :weight => 45 },
			{ :id => 7,   :name => "Breastplate",  :details => [brestplate], :category => "medium", :cost => 400, :ac => 14, :dex_mod => true, :dex_mod_max => 2, :stealth => false, :weight => 20 },			
			{ :id => 8,   :name => "Half Plate", :details => [half_plate], :category => "medium", :cost => 750, :ac => 15, :dex_mod => true, :dex_mod_max => 2, :stealth => true, :weight => 40 },
			{ :id => 9,   :name => "Ring mail",  :details => [ring_mail], :category => "heavy", :cost => 30, :ac => 14, :dex_mod => nil, :dex_mod_max => nil, :strength => 13, :stealth => true, :weight => 40 },
			{ :id => 10,  :name => "Chain Mail", :details => [chain_mail], :details => [], :category => "heavy", :cost => 75, :ac => 16, :dex_mod => nil, :dex_mod_max => nil, :strength => 13, :stealth => true, :weight => 55 },
			{ :id => 11,  :name => "Splint", :details => [splint], :category => "heavy", :cost => 200, :ac => 17, :dex_mod => nil, :dex_mod_max => nil, :strength => 15, :stealth => true, :weight => 60 },
			{ :id => 12,  :name => "Plate", :details => [plate], :category => "heavy", :cost => 1500, :ac => 18, :dex_mod => nil, :dex_mod_max => nil, :strength => 15, :stealth => true, :weight => 65 },
			{ :id => 212, :name => "Shield", :details => [sheild], :category => "shield", :cost => 10, :ac => 2, :dex_mod => nil, :dex_mod_max => nil, :strength => false, :stealth => false, :weight => 6 },
		]
	end
end