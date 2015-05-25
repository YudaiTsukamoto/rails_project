require 'test/unit'
require File.join('./test2.rb')

class VattleTest < Test::Unit::TestCase
  def setup
    @person = Person.new(1000, 1000, 'Person')
    @fighter = Fighter.new(1000, 1000, 'Fighter')
    @wizard = Wizard.new(1000, 1000, 'Wizard')
    @priest = Priest.new(1000, 1000, 'Priest')
  end

  # Personクラスのテスト
  def test_person_should_not_have_blank_parameters
    assert_raise(ArgumentError) do
      person = Person.new(1000, 1000)
    end
  end

  def test_person_strength
    assert_equal(@person.strength, 1000)
  end

  def test_person_strength_should_not_be_zero
    assert_raise(ArgumentError) do
      Person.new(0, 1000, 'Person')
    end
  end

  def test_person_strength_should_not_be_negative_number
    assert_raise(ArgumentError) do
      Person.new(-1000, 1000, 'Person')
    end
  end

  def test_person_strength_should_not_be_float_number
    assert_raise do
      Person.new(1000.5, 1000, 'Person')
    end
  end

  def test_person_cleverness
    assert_equal(@person.cleverness, 1000)
  end

  def test_person_cleverness_should_not_be_zero
    assert_raise(ArgumentError) do
      Person.new(1000, 0, 'Person')
    end
  end

  def test_person_cleverness_should_not_be_negative_number
    assert_raise(ArgumentError) do
      Person.new(1000, -1000, 'Person')
    end
  end

  def test_person_cleverness_should_not_be_float_number
    assert_raise do
      Person.new(1000, 1000.5, 'Person')
    end
  end

  def test_person_name
    assert_equal(@person.name, 'Person')
  end

  def test_person_name_should_be_string
    assert_raise(ArgumentError) do
      person = Person.new(1000, 1000, 1000)
    end
  end

  def test_person_base_strength
    assert_equal(@person.base_strength, 1000)
  end

  def test_person_base_cleverness
    assert_equal(@person.base_cleverness, 1000)
  end

  def test_person_battle_power
    assert_equal(@person.battle_power(@person), 2000)
  end

  def test_person_battle_power_should_not_have_blank_parameters
    assert_raise(ArgumentError) do
      @person.battle_power
    end
  end

  # Fighterクラスのテスト
  def test_fighter_strength
    assert_equal(@fighter.strength, 1500)
  end

  def test_fighter_strength_rounding
    fighter = Fighter.new(999, 1000, 'Fighter')
    assert_equal(fighter.strength, 1499)
  end

  def test_fighter_weakened_battle_power
    assert_equal(@fighter.battle_power(@wizard), 2275)
  end

  def test_fighter_weakened_battle_power_rouding
    fighter = Fighter.new(999, 1000, 'Fighter')
    assert_equal(fighter.battle_power(@wizard), 2274)
  end

  def test_fighter_should_not_have_blank_parameters
    assert_raise(ArgumentError) do
      @fighter.battle_power
    end
  end

  # Wizardクラスのテスト
  def test_wizard_strength
    assert_equal(@wizard.strength, 500)
  end

  def test_wizard_strength_rounding
    wizard = Wizard.new(999, 1000, 'Wizard')
    assert_equal(wizard.strength, 500)
  end

  def test_wizard_cleverness
    assert_equal(@wizard.cleverness, 3000)
  end

  def test_wizard_weakened_battle_power
    assert_equal(@wizard.battle_power(@priest), 2750)
  end

  def test_wizard_weakened_battle_power_rounding
    wizard = Wizard.new(1000, 999, 'wizard')
    assert_equal(wizard.battle_power(@priest), 2748)
  end

  def test_wizard_should_not_have_blank_parameters
    assert_raise(ArgumentError) do
      @wizard.battle_power
    end
  end

  # priestクラスのテスト
  def test_priest_cleverness
    assert_equal(@priest.cleverness, 2000)
  end

  def test_priest_weakened_battle_power
    assert_equal(@priest.battle_power(@fighter), 2750)
  end

  def test_priest_weakened_battle_power_rounding
    priest = Priest.new(999, 1000, 'priest')
    assert_equal(priest.battle_power(@fighter), 2749)
  end

  def test_priest_should_not_have_blank_parameters
    assert_raise(ArgumentError) do
      @priest.battle_power
    end
  end

  # battleメソッドのテスト
  def test_draw_battle
    assert_equal(battle(@person, @person), nil)
  end

  def test_battle_winner_is_person1
    person1 = Person.new(1001, 1000, 'person1')
    person2 = Person.new(1000, 1000, 'person2')
    assert_equal(battle(person1, person2), person1)
  end

  def test_battle_fighter_wins_wizard
    fighter = Fighter.new(1000, 2226, 'fighter')
    wizard = Wizard.new(1000, 1000, 'wizard')
    assert_equal(battle(fighter, wizard), fighter)
  end

  def test_battle_wizard_wins_fighter_
    fighter = Fighter.new(1000, 2224, 'fighter')
    wizard = Wizard.new(1000, 1000, 'wizard')
    assert_equal(battle(fighter, wizard), wizard)
  end

  def test_battle_wizard_wins_priest
    wizard = Wizard.new(1501, 1000, 'wizard')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(wizard, priest), wizard)
  end

  def test_battle_priest_wins_wizard
    wizard = Wizard.new(1498, 1000, 'wizard')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(wizard, priest), priest)
  end
  def test_battle_priest_wins_fighter
    priest = Priest.new(1000, 1000, 'priest')
    fighter = Fighter.new(1000, 1249, 'fighter')
    assert_equal(battle(priest, fighter), priest)
  end

  def test_battle_fighter_wins_priest
    priest = Priest.new(1000, 1000, 'priest')
    fighter = Fighter.new(1000, 1251, 'fighter')
    assert_equal(battle(priest, fighter), fighter)
  end

  def test_battle_should_not_have_blank_person
    assert_raise(ArgumentError) do
      battle
    end
  end
end
