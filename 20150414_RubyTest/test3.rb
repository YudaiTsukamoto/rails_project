require 'test/unit'
require File.join('./test2.rb')

class BattleTest < Test::Unit::TestCase
  def setup
    @person = Person.new(1000, 1000, 'Person')
    @fighter = Fighter.new(1000, 1000, 'Fighter')
    @wizard = Wizard.new(1000, 1000, 'Wizard')
    @priest = Priest.new(1000, 1000, 'Priest')
  end

  # Personクラスのテスト

  def test_person_strength
    assert_equal(@person.strength, 1000)
  end

  def test_person_strength_should_not_be_float_number
    assert_raise(ArgumentError) do
      Person.new(1000.5, 1000, 'Person')
    end
  end

  def test_person_strength_should_be_number_100_and_over
    assert_raise(ArgumentError) do
      Person.new(99, 1000, 'person')
    end
  end

  def test_person_cleverness
    assert_equal(@person.cleverness, 1000)
  end

  def test_person_cleverness_should_not_be_float_number
    assert_raise do
      Person.new(1000, 1000.5, 'Person')
    end
  end

  def test_person_cleverness_should_be_number_100_and_over
    assert_raise(ArgumentError) do
      Person.new(1000, 99, 'person')
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

  # battleメソッドのテスト

  def test_same_person_can_not_battle
    assert_raise(ArgumentError) do
      battle(@person, @person)
    end
  end

  def test_battle_fighter1_draw_fighter2
    fighter1 = Fighter.new(1000, 1000, 'fighter1')
    fighter2 = Fighter.new(1000, 1000, 'fighter1')
    assert_equal(battle(fighter1, fighter2), nil)
  end

  def test_battle_fighter1_wins_fighter2
    fighter1 = Fighter.new(1001, 1000, 'fighter1')
    fighter2 = Fighter.new(1000, 1000, 'fighter2')
    assert_equal(battle(fighter1, fighter2), fighter1)
  end

  def test_battle_fighter_draw_wizard
    fighter = Fighter.new(1000, 2225, 'fighter')
    wizard = Wizard.new(1000, 1000, 'wizard')
    assert_equal(battle(fighter, wizard), nil)
  end

  def test_battle_fighter_wins_wizard
    fighter = Fighter.new(1000, 2226, 'fighter')
    wizard = Wizard.new(1000, 1000, 'wizard')
    assert_equal(battle(fighter, wizard), fighter)
  end

  def test_battle_fighter_draw_priest
    fighter = Fighter.new(1000, 1250, 'fighter')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(fighter, priest), nil)
  end

  def test_battle_fighter_wins_priest
    fighter = Fighter.new(1000, 1251, 'fighter')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(fighter, priest), fighter)
  end

  def test_battle_wizard1_draw_wizard2
    wizard1 = Wizard.new(1000, 1000, 'wizard1')
    wizard2 = Wizard.new(1000, 1000, 'wizard2')
    assert_equal(battle(wizard1, wizard2), nil)
  end

  def test_battle_wizard1_wins_wizard2
    wizard1 = Wizard.new(1001, 1000, 'wizard1')
    wizard2 = Wizard.new(1000, 1000, 'wizard2')
    assert_equal(battle(wizard1, wizard2), wizard1)
  end

  def test_battle_wizard_wins_fighter
    fighter = Fighter.new(1000, 2224, 'fighter')
    wizard = Wizard.new(1000, 1000, 'wizard')
    assert_equal(battle(fighter, wizard), wizard)
  end

  def test_battle_wizard_draw_priest
    wizard = Wizard.new(1500, 1000, 'wizard')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(wizard, priest), nil)
  end

  def test_battle_wizard_wins_priest
    wizard = Wizard.new(1502, 1000, 'wizard')
    priest = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(wizard, priest), wizard)
  end

  def test_battle_priest1_draw_priest2
    priest1 = Priest.new(1000, 1000, 'priest')
    priest2 = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(priest1, priest2), nil)
  end

  def test_battle_priest1_wins_priest2
    priest1 = Priest.new(1001, 1000, 'priest')
    priest2 = Priest.new(1000, 1000, 'priest')
    assert_equal(battle(priest1, priest2), priest1)
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
end
