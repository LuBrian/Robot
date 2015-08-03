require 'pry'
class Robot
	attr_reader :position,:items,:health,:damage
	attr_accessor :items_weight, :equipped_weapon, :shield
	@count = 0
	@robot_positions = []
	class << self
		attr_accessor :count,:robot_positions
	end

	def initialize
		@position = [0,0]
		@items = []
		@items_weight = 0
		@health = 100
		@damage = 5
		@equipped_weapon = equipped_weapon
		@shield = 50
		self.class.count += 1
		self.class.robot_positions << @position

	end


	def move_left
		
		@position[0] -= 1
	end

	def move_right
		@position[0] += 1
	end

	def move_up
		@position[1] += 1
	end

	def move_down
		@position[1] -= 1
	end



	def pick_up(item)
		if item.is_a? Weapon
			@equipped_weapon = item
		elsif item.is_a?(BoxOfBolts) && health <=80
			item.feed(self)
		elsif item.weight + @items_weight <= 250
			@items << item
			@items_weight += item.weight
			true
		else
			false
		end
	end


	def wound(damage)
		if @shield > 0
			@shield -= damage
			
			if shield <= 0
				@shield = 0
				@health -= (damage-50)
				if health <= 0
					@health = 0
				end
			end
		elsif shield <= 0
			damage >100 ? @health = 0 : @health -= damage
		end
	end


	def heal(healing)
		if health >=100
			@health = 100
		else
			@health	+= healing
		end
	end

	def attack(enemy)
		if equipped_weapon.is_a?(Weapon) && enemy.position[0] < 2 && enemy.position[0] > -2 && enemy.position[1] < 2 && enemy.position[1] > -2
			@equipped_weapon.hit(enemy)
			
		elsif equipped_weapon.is_a?(Grenade) && enemy.position[0] <= 2 && enemy.position[0] >= -2 && enemy.position[1] <= 2 && enemy.position[1] >= -2
			@equipped_weapon.hit(enemy)
			@equipped_weapon = nil
		elsif enemy.is_a?(Robot) && enemy.position[0] < 2 && enemy.position[0] > -2 && enemy.position[1] < 2 && enemy.position[1] > -2
			enemy.wound(@damage)	
		end
		
	end


	def heal!
		if health <= 0
			raise "The robot is dead, it cannot be revived!"
		end
	end


	def attack!(target)
		if target.is_a? Item
			raise "The target has to be a robot, cannot attack items!"
		end
	end



end

# @robot1 = Robot.new
# @robot2 = Robot.new
# @robot3 = Robot.new
# @robot2.move_down
# @robot2.move_down
# binding.pry
# @robot4 = Robot.new

# puts Robot.count

# puts Robot.robot_positions