module ArmourList
	def armour
		{
			:padded => { :category => "light", :cost => 5, :ac => 11, :dex_mod => true, :dex_mod_max => false, :stealth => true, :weight => 8 },
			:half_plate => { :name => "Half Plate", :category => "medium", :cost => 750, :ac => 15, :dex_mod => true, :dex_mod_max => 2, :strength => 13, :stealth => true, :weight => 40 }
		}
	end
end