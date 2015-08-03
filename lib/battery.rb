class Battery < Item

	def initialize
		super("Battery",25)
	end

	def feed(robots)

		robots.shield = 50
	end


end