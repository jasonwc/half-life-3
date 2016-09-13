class Enemy
  attr_reader :name

  def take_damage(damage)
    @health -= damage
    puts "#{@name} now at #{@health} health"
    puts "#{@name} killed!" if dead?
  end

  def attack(player)
    puts "A #{@name} attacks Gordon!"
    player.take_damage(@damage)
  end

  def alive?
    @health > 0
  end

  def dead?
    @health <= 0
  end
end
