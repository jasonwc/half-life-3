require "./enemies/enemy"

class HeadCrab < Enemy
  def initialize
    @name = "Headcrab"
    @health = 10
    @damage = 12
  end
end
