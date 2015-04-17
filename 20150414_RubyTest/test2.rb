class Person
	STRENGTH = 0
	CLEVERNESS = 1
	attr_reader :strength, :cleverness, :name

	def initialize(st, cl, name)
		@strength = st
		@cleverness = cl
		@name = name
	end

	def weakening_strength(vs_person)
		weakening_rate = Weakening.new(self, vs_person).weakening_rate
		strength * weakening_rate[STRENGTH]
	end

	def weakening_cleverness(vs_person)
		weakening_rate = Weakening.new(self, vs_person).weakening_rate
		cleverness * weakening_rate[CLEVERNESS]
	end
end

class Fighter < Person
	alias base_strength strength
	def strength
		base_strength * 1.5
	end

	alias base_cleverness cleverness
	def cleverness
		base_cleverness * 1.0
	end
end

class Wizard < Person
	alias base_strength strength
	def strength
		base_strength * 0.5
	end

	alias base_cleverness cleverness
	def cleverness
		base_cleverness * 3.0
	end
end
# 1.Priestクラスを追加する
class Priest < Person
	alias base_strength strength
	def strength
		base_strength * 1.0
	end

	alias base_cleverness cleverness
	def cleverness
		base_cleverness * 2.0
	end
end

# 2.1対1の対戦機能を実装する
class Battle 
	attr_reader :person1, :person2, :winner

	def initialize(person1, person2)
		@person1 = person1
		@person2 = person2
		@winner = nil
	end

	def battle
		puts "◆#{person1.name}(#{person1.class}) VS #{person2.name}(#{person2.class})◆"
		puts "勝者:#{judge}"
	end

	def judge
		battle_power1 = person1.weakening_strength(person2) + person1.weakening_cleverness(person2)
		battle_power2 = person2.weakening_strength(person1) + person2.weakening_cleverness(person1)

		if battle_power1 == battle_power2
			return "引き分け"
		elsif battle_power1 > battle_power2
			return "#{person1.name}"
		else
			return "#{person2.name}"
		end
	end
end

class Weakening
	attr_reader :weakening_rate
	def initialize(person1, person2)
		if person1.instance_of?(Fighter) && person2.instance_of?(Wizard)
			@weakening_rate = [0.85, 1.0]
		elsif person1.instance_of?(Wizard) && person2.instance_of?(Priest)
			@weakening_rate = [1.0, 0.75]
		elsif person1.instance_of?(Priest) && person2.instance_of?(Fighter)
			@weakening_rate = [0.95, 0.90]
		else
			@weakening_rate = [1.0, 1.0]
		end
	end
end

person1 = Fighter.new(100, 100, "塚本")
person2 = Wizard.new(100, 100, "菅野")
battle = Battle.new(person1, person2).battle
