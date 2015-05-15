class Person
  attr_reader :strength, :cleverness, :name

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    @strength = st
    @cleverness = cl
    @name = name
  end
end

class Fighter < Person
  def strength
    base_strength * 1.5
  end

  def compensate_rate(vs_person)
    if vs_person.instance_of?(Wizard)
      return { strength: 0.85, cleverness: 1.0 }
    else
      return { strength: 1.0, cleverness: 1.0 }
    end
  end
end

class Wizard < Person
  def strength
    base_strength * 0.5
  end

  def cleverness
    base_cleverness * 3.0
  end

  def compensate_rate(vs_person)
    if vs_person.instance_of?(Priest)
      return { strength: 1.0, cleverness: 0.75 }
    else
      return { strength: 1.0, cleverness: 1.0 }
    end
  end
end

class Priest < Person
  def cleverness
    base_cleverness * 2.0
  end

  def compensate_rate(vs_person)
    if vs_person.instance_of?(Fighter)
      return { strength: 0.95, cleverness: 0.90 }
    else
      return { strength: 1.0, cleverness: 1.0 }
    end
  end
end

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

  private

  def battle_power(oneself, vs_person)
    compensate_rate = oneself.compensate_rate(vs_person)
    compensate_strength = oneself.strength * compensate_rate[:strength]
    compensate_cleverness = oneself.cleverness * compensate_rate[:cleverness]
    compensate_strength + compensate_cleverness
  end

  def judge(battle_power1, battle_power2)
    if battle_power1 > battle_power2
      return person1
    elsif battle_power1 < battle_power2
      return person2
    else
      return nil
    end
  end
end

def result(battle)
  puts "#{battle.person1.name} (#{battle.person1.class}) VS #{battle.person2.name} (#{battle.person2.class})"
  if battle.winner
    puts "Winner : #{battle.winner.name} (#{battle.winner.class})"
  else
    puts 'A drawn match.'
  end
end

person1 = Priest.new(100, 100, 'Tsukamoto')
person2 = Wizard.new(100, 100, 'Kanno')
battle1 = Battle.new(person1, person2)
result(battle1)
