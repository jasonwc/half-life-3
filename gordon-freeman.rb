require "./weapons/crowbar"
require "./weapons/pistol"
require "./weapons/submachine-gun"

class GordonFreeman
  attr_accessor :health, :weapon, :weapons

  def initialize(game)
    @game = game
    @health = 100
    @weapon = nil
    @medkits = 3
    @weapons = ["Crowbar"]
  end

  def attack(enemy)
    puts "Attacking #{enemy.name} with #{@weapon.name}"
    enemy.take_damage(@weapon.damage)
    sleep(1)
  end

  def use_medkit
    if @medkits > 0
      puts "Gordon uses a medkit!"
      @health += 20
      puts "Gordons health restored to #{@health}"
      @medkits -= 1
      puts "#{@medkits} remaining!"
    else
      puts "Gordon is out of medkits!"
    end
  end

  def take_damage(damage)
    @health -= damage
    @game.end_game if dead?
    puts "Gordon has #{@health} health remaining"
    puts @game.prompt_medkit if low_health?
  end

  def low_health?
    @health <= 33
  end

  def choose_weapon
    puts "Which weapon would you like?"
    puts @weapons.join("\n")
    switch_weapon weapon if @weapons.include? weapon
  end

  def switch_weapon(weapon)
    @weapon = Object.const_get(weapon).new
    puts "Switched to #{@weapon.name}"
  end

  def pick_up_can(can)
    puts "Do you pick up the can? (y/n)"
    can = false if gets.chomp == "y"
  end
  
  def dead?
    @health <= 0
  end
end
