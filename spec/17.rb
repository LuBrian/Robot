require_relative 'spec_helper'

describe Robot do 

	before :each do 
		@robot1 = Robot.new
		@robot2 = Robot.new
		@robot3 = Robot.new
		@robot4 = Robot.new
	end

	it "count the number of the robots that are instantiated" do 
		expect(Robot.count).to eq(4)
	end
end
