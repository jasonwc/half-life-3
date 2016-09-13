require "./enemies/ant-lion"
require "./levels/level"

class HighwaySeventeen < Level
  def initialize(player, difficulty)
    @player = player
    @antlions = Array.new(difficulty) { AntLion.new }
  end

  def start
    print_bar
    puts "Chapter 7: Highway 17"
    puts "Freeman is informed that Eli Vance has been taken to Nova Prospekt and sets out on a journey"
    puts "along Highway 17 to rescue him."
    print_bar

    while @antlions.any?(&:alive?)
      print_bar
      puts "#{@antlions.reject(&:dead?).count} antlions remaining"
      next_enemy.attack(@player) if rand(0..1) < 0.40
      @player.attack(next_enemy)
      print_bar
    end
    puts "Level over!"
  end

  def next_enemy
    @antlions.reject(&:dead?).first
  end
end
