class Person
  attr_reader :strength, :cleverness, :name

  alias base_strength strength
  alias base_cleverness cleverness

  def initialize(st, cl, name)
    raise ArgumentError.new("strength should be positive number") if st <= 0
    raise ArgumentError.new("cleverness should be positive number") if cl <= 0
    raise ArgumentError.new("strength should be integer") unless st.integer?
    raise ArgumentError.new("cleverness should be integer") unless cl.integer?
    raise ArgumentError.new("name should be string") unless name.is_a?(String)

    @strength = st
    @cleverness = cl
    @name = name
  end

  def battle_power(vs_person)
    strength + cleverness
  end

  def battle(vs_person)
    if battle_power(vs_person) == vs_person.battle_power(self)
      return nil
    elsif battle_power(vs_person) > vs_person.battle_power(self)
      return self
    else
      vs_person
    end
  end
end

class Fighter < Person
  def strength
    (base_strength * 1.5).round
  end

  def battle_power(vs_person)
    if vs_person.is_a?(Wizard)
      (strength * 0.85 + cleverness).round
    else
      super
    end
  end
end

class Wizard < Person
  def strength
    (base_strength * 0.5).round
  end

  def cleverness
    base_cleverness * 3.0
  end

  def battle_power(vs_person)
    if vs_person.is_a?(Priest)
      (strength + cleverness * 0.75).round
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
      (strength * 0.95 + cleverness * 0.90).round
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

# fighter = Fighter.new(1000, 2226, 'Yudai')
# wizard = Wizard.new(1000, 1000, 'Hisaki')
# p fighter.battle_power(wizard)
# p wizard.battle_power(fighter)
# p winner = fighter.battle(wizard)
#
# if !winner
#   puts "Draw"
# else
#   puts "Winner : #{winner.name}(#{winner.class})"
# end
