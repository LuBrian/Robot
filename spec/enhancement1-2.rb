require_relative 'spec_helper'

# describe Robot do
# 	before :each do 
# 		@robot = Robot.new
# 	end

# 	describe "#heal!" do
# 		it "returns error if the robot has a 0 health, the dead robot can not be healed!" do 
# 			expect(@robot.heal!).to receive(:health).and_return(0)
# 			expect { raise StandardError }.to raise_error
# 		end

# 	end




# end

RSpec.describe "calling a mising method" do 
	before :each do 
		@robot = Robot.new
	end

	it "raises" do 
	
		expect(@robot).to receive(:health).and_return(0)
		expect { @robot.heal! }.to raise_error
	end

	it "raises" do
		enemy = Item.new("haha",40)
		expect { @robot.attack!(enemy) }.to raise_error
	end
end