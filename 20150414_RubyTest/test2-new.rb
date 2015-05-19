class Person
  attr_reader :strength, :cleverness, :name

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    @strength = st
    @cleverness = cl
    @name = name
  end

  def battle_power(vs_person)
    strength + cleverness
  end
end

class Fighter < Person
  def strength
    base_strength * 1.5
  end

  def battle_power(vs_person)
    if vs_person.is_a?(Wizard)
      strength * 0.85 + cleverness
    else
      super
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

  def battle_power(vs_person)
    if vs_person.is_a?(Priest)
      strength + cleverness * 0.75
    else
      super
    end
  end
end

class Priest < Person
  def cleverness
    base_cleverness * 2.0
  end

  def battle_power(vs_person)
    if vs_person.is_a?(Fighter)
      strength * 0.95 + cleverness * 0.90
    else
      super
    end
  end
end

def battle(person1, person2)
  if person1.battle_power(person2) == person2.battle_power(person1)
    return nil
  elsif person1.battle_power(person2) > person2.battle_power(person1)
    return person1
  else
    return person2
  end
end

person1 = Fighter.new(150, 100, 'Tsukamoto')
person2 = Wizard.new(100, 100, 'Kanno')
winner = battle(person1, person2)
puts winner
if winner == nil
  puts "引き分け"
else
  puts "勝者 : #{winner.name}(#{winner.class})"
end
