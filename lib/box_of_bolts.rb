class BoxOfBolts < Item
	
	def initialize
		super(name,weight)
		@name = "Box of bolts"
		@weight = 25
	end

	def feed(robots)
		
		robots.heal(20)
	end
end