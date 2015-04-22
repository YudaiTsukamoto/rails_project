class Person
    attr_reader :strength, :cleverness, :name

    def initialize(st, cl, name)
        @strength = st
        @cleverness = cl
        @name = name
    end

    def conpensate_status(vs_person)
        if self.instance_of?(Fighter) && vs_person.instance_of?(Wizard)
            @strength = base_strength * 0.85
        elsif self.instance_of?(Wizard) && vs_person.instance_of?(Priest)
            @cleverness = base_cleverness * 0.75
        elsif self.instance_of?(Priest) && vs_person.instance_of?(Fighter)
            @strength = base_strength * 0.95
            @cleverness = base_cleverness * 0.90
        end
    end

    def battle_power
        @battle_power = strength + cleverness 
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

class BattleController
    attr_reader :battle_model, :battle_view
    def initialize(battle_model, battle_view)
        @battle_model = battle_model
        @battle_view = battle_view
    end

    def battle_start
        battle_model.battle
        battle_view.display_result
    end
end

class BattleModle
    attr_reader :person1, :person2, :winner
    def initialize(person1, person2)
        @person1 = person1
        @person2 = person2
    end

    def battle 
        person1.conpensate_status(person2)
        person2.conpensate_status(person1)

        if person1.battle_power > person2.battle_power
            return  @winner = person1
        elsif person1.battle_power < person2.battle_power
            return  @winner =  person2
        end
    end
end

class BattleView 
    attr_reader :battle
    def initialize(battle)
        @battle = battle
    end

    def display_result
        puts "#{battle.person1.name}(#{battle.person1.class}) VS #{battle.person2.name}(#{battle.person2.class})"
        if battle.winner
            puts "勝者 : #{battle.winner.name}(#{battle.winner.class})"
        else
            puts "引き分けです"
        end
    end
end

person1 = Fighter.new(100, 100, "塚本")
person2 = Wizard.new(100, 100, "菅野")
person3 = Priest.new(100, 100, "加藤")
battle_model = BattleModle.new(person3, person2)
battle_view = BattleView.new(battle_model)
battle_controller = BattleController.new(battle_model, battle_view)
battle_controller.battle_start
