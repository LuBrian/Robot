class Weapon < Item
	attr_reader :damage
	
	def initialize(name,weight,damage)
		super(name,weight)
		@damage = damage
	end


	def hit(target)
		# binding.pry
		target.wound(@damage)
	end



end