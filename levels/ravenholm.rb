require "./enemies/headcrab"
require "./levels/level"

class Ravenholm < Level
  def initialize(player, difficulty)
    @player = player
    @headcrabs = Array.new(difficulty) { HeadCrab.new }
  end

  def start
    print_bar
    puts "Chapter 6: We don't go to Ravenholm..."
    puts "Originally a hidden village that lived free from the rule of the Combine, Ravenholm was"
    puts "discovered by the Combine and attacked by hundreds of Headcrab Shells, thus transforming almost"
    puts "the entire population into deadly Zombies."
    print_bar

    while @headcrabs.any?(&:alive?)
      print_bar
      puts "#{@headcrabs.reject(&:dead?).count} headcrabs remaining"
      next_enemy.attack(@player) if rand(0..1) < 0.33
      @player.attack(next_enemy)
      print_bar      
    end
    puts "Level over!"
  end

  def next_enemy
    @headcrabs.reject(&:dead?).first
  end
end
