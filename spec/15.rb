require_relative 'spec_helper'

describe Robot do 

	before :each do 
		@robot = Robot.new
	end

	describe "#wound" do 
		it "should do damage on shield if the shield is greater than 0" do 
			@robot.wound(30)
			expect(@robot.shield).to eq(20)
		end

		it "should do damage on the health if the damage is greater than the shield strength" do 
			@robot.wound(100)
			expect(@robot.health).to eq(50)
			expect(@robot.shield).to eq(0)
		end

		it "should kill the robot if the damage is greater than the sum of its health and shield" do 
			@robot.wound(150)
			expect(@robot.health).to eq(0)
		end

	end

end


