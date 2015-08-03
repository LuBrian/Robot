require_relative 'spec_helper'

describe Robot do 
	before :each do 
		@robot1 = Robot.new
		@robot1.move_down
		@robot1.move_down
		@robot2 = Robot.new
		@robot2.move_right
		@robot2.move_right
	end

	it "will return the the list of two robots' positions as [[0,-2],[2,0]]" do 
		expect(Robot.robot_positions).to eq([[0,-2],[2,0]])
	end
end