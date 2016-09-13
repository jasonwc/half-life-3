require "./enemies/civil-protection-officer"
require "./levels/level"
require "./weapons/crowbar"

class PointInsertion < Level
  def initialize(player, difficulty)
    @player = player
    @civil_protection_officers = Array.new(difficulty) { CivilProtectionOfficer.new }
    @can = true
  end

  def start
    print_bar
    puts "Chapter 1: Point Insertion"
    puts "Nearly twenty years after the Black Mesa Incident the G-Man wakes Gordon Freeman and inserts him"
    puts "(seemingly, without any goals) into a train arriving in City 17, a city under control of the"
    puts "Combine Empire located somewhere in Eastern Europe."
    print_bar

    while @can
      print_bar
      @civil_protection_officers.first.pick_up_that_can(@player, @can)
      print_bar
    end
    
    give_player_crowbar
    puts "You've escaped into the sewers!"
    puts "Level over!"
  end

  def give_player_crowbar
    puts "Gordon finds a crowbar!"
    crowbar = Crowbar.new
    @player.weapon = crowbar
    @player.weapons << crowbar
  end

  def next_enemy
    @headcrabs.reject(&:dead?).first
  end
end
