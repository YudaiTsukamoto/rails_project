class Person
  attr_reader :strength, :cleverness, :name
  def initialize(st, cl, name)
    @strength = st
    @cleverness = cl
    @name = name
  end
  # def battle_power
  #   @battle_power = strength + cleverness
  # end
end

class Fighter < Person

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    super
    @strength = base_strength * 1.5
  end

  def conpensate_rate(vs_person)
    if vs_person.instance_of?(Wizard)
      @conpensate_rate = { strength: 0.85, cleverness: 1.0 }
    else
      @conpensate_rate = { strength: 1.0, cleverness: 1.0 }
    end
  end
end

class Wizard < Person

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    super
    @strength = base_strength * 0.5
    @cleverness = base_cleverness * 3.0
  end

  def conpensate_rate(vs_person)
    if vs_person.instance_of?(Priest)
      @conpensate_rate = { strength: 1.0, cleverness: 0.75 }
    else
      @conpensate_rate = { strength: 1.0, cleverness: 1.0 }
    end
  end
end
# 1.Priestクラスを追加する
class Priest < Person

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    super
    @cleverness = base_cleverness * 2.0
  end

  def conpensate_rate(vs_person)
    if vs_person.instance_of?(Priest)
      @conpensate_rate = { strength: 0.95, cleverness: 0.90 }
    else
      @conpensate_rate = { strength: 1.0, cleverness: 1.0 }
    end
  end
end

# 2.1対1の対戦機能を実装する

class Battle
  attr_reader :person1, :person2, :winner

  def initialize(person1, person2)
    @person1 = person1
    @person2 = person2
  end

  def battle
    battle_power1 = battle_power(person1, person2)
    battle_power2 = battle_power(person2, person1)
    @winner = judge(battle_power1, battle_power2)
  end

  def battle_power(myself, vs_person)
    conpensate_rate = myself.conpensate_rate(vs_person)
    conpensate_strength = myself.strength * conpensate_rate[:strength]
    conpensate_cleverness = myself.cleverness * conpensate_rate[:cleverness]
    conpensate_strength + conpensate_cleverness
  end

  def judge(battle_power1, battle_power2)
    if battle_power1 > battle_power2
      return person1
      elsif battle_power1 < battle_power2
      return person2
    end
  end
end

person1 = Fighter.new(100, 100, "塚本")
person2 = Wizard.new(100, 100, "菅野")
# p person1.conpensate_status(person2)
# battle_controller = BattleController.new(person1, person2)
# battle_controller.battle
b1 = Battle.new(person1, person2)
b1.battle
puts "#{person1.name}(#{person1.class}) VS #{person2.name}(#{person2.class})"
puts "Winner : #{b1.winner.name}(#{b1.winner.class})"
b2 = Battle.new(person1, person2)
puts "#{person1.name}(#{person1.class}) VS #{person2.name}(#{person2.class})"
b2.battle
puts "Winner : #{b2.winner.name}(#{b2.winner.class})"
