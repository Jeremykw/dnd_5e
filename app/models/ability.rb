class Ability < ActiveRecord::Base
	belongs_to :character

	#valadateions
	stats = :str, :dex, :con, :int, :wis, :char
	validates_presence_of stats
	validates_numericality_of stats, only_integer: true, greater_than: 3, less_than: 21


end
