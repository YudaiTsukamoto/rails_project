require 'test/unit'
require File.join('./test2.rb')

class VattleTest < Test::Unit::TestCase

	def setup
		person1 = Fighter.new(100, 100, "塚本")
		person2 = Wizard.new(100, 100, "菅野")
		@battle = Battle.new(person1, person2)
	end

	def test_judge
		assert_equal "菅野", @battle.judge
	end

	def test_battle

	end
end

class WeakeTest < Test::Unit::TestCase

	def setup
		person1 = Fighter.new(100, 100, "塚本")
		person2 = Wizard.new(100, 100, "塚本")
		person3 = Priest.new(100, 100, "塚本")
		@weakening1 = Weakening.new(person1, person1)
		@weakening2 = Weakening.new(person1, person2)
		@weakening3 = Weakening.new(person1, person3)
		@weakening4 = Weakening.new(person2, person1)
		@weakening5 = Weakening.new(person2, person2)
		@weakening6 = Weakening.new(person2, person3)
		@weakening7 = Weakening.new(person3, person1)
		@weakening8 = Weakening.new(person3, person2)
		@weakening9 = Weakening.new(person3, person3)
	end

	def test_weakening_Fighter_vs_Fighter
		assert_equal @weakening1.weakening_rate, [1.0, 1.0]
	end

	def test_weakening_Fighter_vs_Wizard
		assert_equal @weakening2.weakening_rate, [0.85, 1.0]
	end

	def test_weakening_Fighter_vs_Priest
		assert_equal @weakening3.weakening_rate, [1.0, 1.0]
	end

	def test_weakening_Wizard_vs_Fighter
		assert_equal @weakening4.weakening_rate, [1.0, 1.0]
	end

	def test_weakening_Wizard_vs_Wizard
		assert_equal @weakening5.weakening_rate, [1.0, 1.0]
	end

	def test_weakening_Wizard_vs_Priest
		assert_equal @weakening6.weakening_rate, [1.0, 0.75]
	end

	def test_weakening_Priest_vs_Fighter
		assert_equal @weakening7.weakening_rate, [0.95, 0.90]
	end

	def test_weakening_Priest_vs_Wizard
		assert_equal @weakening8.weakening_rate, [1.0, 1.0]
	end

	def test_weakening_Prist_vs_Priest
		assert_equal @weakening9.weakening_rate, [1.0, 1.0]
	end
end
