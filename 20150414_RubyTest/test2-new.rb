class Person
  attr_reader :strength, :cleverness, :name

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    @strength = st
    @cleverness = cl
    @name = name
  end

  def battle_power
    strength + cleverness
  end
end

class Fighter < Person
  def strength
    base_strength * 1.5
  end

  def battle(vs_person)
    if vs_person.is_a?(Wizard)
      battle_power = streng
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
end

class Priest < Person
  def cleverness
    base_cleverness * 2.0
  end
end

person1 = Priest.new(100, 100, 'Tsukamoto')
person2 = Wizard.new(100, 100, 'Kanno')

if person1.battle(person2)
  puts "勝者:#{person1.battle(person2).name}"
else
  puts "引き分けです"
end
