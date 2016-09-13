require "./gordon-freeman"
require "./levels/ravenholm"
require "./levels/highway-seventeen"
require "./levels/point-insertion"

class HalfLife3
  def initialize(options = {})
    @player = GordonFreeman.new(self)
    @levels = ["Point Insertion", "Ravenholm", "Highway Seventeen"]
  end

  def play(level)
    level = level.gsub(" ", "")
    puts "What difficulty do you want to play at? 1-10"
    difficulty = gets.chomp.to_i
    @level = Object.const_get(level).new(@player, difficulty)
    @level.start
    on_level_completed
  end

  def on_level_completed
    puts "Next level? (y/n)"
    if gets.chomp == "y"
      select_level
    end
  end

  def select_level
    puts "Which level do you want to play?"
    puts @levels.join("\n")
    level = gets.chomp
    play(level) if @levels.include? level
  end

  def welcome
    puts "Welcome to Half Life 3, in Ruby!"
  end 

  def prompt_medkit
    puts "Gordon has low health!"
    puts "Do you want to use a medkit? (y/n)"
    @player.use_medkit if gets.chomp == "y"
  end

  def prompt_switch_weapon
    puts "Gordon has the following weapons:"
    puts @player.weapons.join(", ")
    puts "Would you like to switch? (y/n)"
    @player.choose_weapon if gets.chomp == "y"
  end

  def end_game
    puts "Game Over!"
    exit
  end
end
