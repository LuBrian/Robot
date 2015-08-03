require_relative 'spec_helper'



describe Robot do 

	before :each do 
		@robot = Robot.new
		@battery = Battery.new
	end

	it "battery should belong to item" do 
		expect(@battery).to be_a(Item)
	end

	it "should have a weight of 25" do 
		expect(@battery.weight).to eq(25)
	end

	describe "#feed" do

		it "battery should give the robot full shield" do 
			@robot.shield = 15
			@battery.feed(@robot)
			expect(@robot.shield).to eq(50)
		end

	end


end


