require 'test/unit'
require File.join('./test2.rb')

class VattleTest < Test::Unit::TestCase
  def setup
    @person = Person.new(100, 100, 'Person')
    @fighter = Fighter.new(100, 100, 'Fighter')
    @wizard = Wizard.new(100, 100, 'Wizard')
    @priest = Priest.new(100, 100, 'Priest')
  end

# Personクラスのテスト
  def test_person_new_false
    assert_raise(ArgumentError) do
    person = Person.new(100, 100)
    end
  end

  def test_person_strength
    assert_equal(@person.strength, 100)
  end

  def test_person_cleverness
    assert_equal(@person.cleverness, 100)
  end

  def test_person_name
    assert_equal(@person.name, 'Person')
  end

  def test_person_base_strength
    assert_equal(@person.base_strength, 100)
  end

  def test_person_base_cleverness
    assert_equal(@person.base_cleverness, 100)
  end

  def test_person_battle_power
    assert_equal(@person.battle_power(@person), 200)
  end

  def test_person_battle_power_false
    assert_raise(ArgumentError) do
      @person.battle_power
    end
  end

# Fighterクラスのテスト
  def test_fighter_strength
    assert_equal(@fighter.strength, 150)
  end

  def test_fighter_weakened_battle_power
    assert_equal(@fighter.battle_power(@wizard), 227.5)
  end

  def test_fighter_battle_power_false
    assert_raise(ArgumentError) do
      @fighter.battle_power
    end
  end

# Wizardクラスのテスト
  def test_wizard_strength
    assert_equal(@wizard.strength, 50)
  end

  def test_wizard_cleverness
    assert_equal(@wizard.cleverness, 300)
  end

  def test_wizard_weakened_battle_power
    assert_equal(@wizard.battle_power(@priest), 275)
  end

  def test_wizard_battle_power_false
    assert_raise(ArgumentError) do
      @wizard.battle_power
    end
  end

# priestクラスのテスト
  def test_priest_cleverness
    assert_equal(@priest.cleverness, 200)
  end

  def test_priest_weakened_battle_power
    assert_equal(@priest.battle_power(@fighter), 275)
  end

  def test_priest_battle_power_false
    assert_raise(ArgumentError) do
      @priest.battle_power
    end
  end

# battleメソッドのテスト
  def test_draw_battle
    assert_equal(battle(@fighter, @fighter), nil)
  end

  def test_battle_winner_is_person1
    assert_equal(battle(@wizard, @fighter), @wizard)
  end

  def test_battle_winner_is_person2
    assert_equal(battle(@wizard, @priest), @priest)
  end
end
