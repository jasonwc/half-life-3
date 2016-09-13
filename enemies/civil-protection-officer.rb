require "./enemies/enemy"

class CivilProtectionOfficer < Enemy
  def initialize
    @name = "Civil Protection Officer"
    @damage = 15
    @health = 10
  end

  def pick_up_that_can(player, can)
    puts "Civil Protection Officer: 'Pickup that can'"
    player.pick_up_can(can)
    enforce_compliance(player) if can
  end

  def enforce_compliance(player)
    puts "The Civil Protection Officer enforces compliance on Gordon"
    player.take_damage(@damage)
  end
end
