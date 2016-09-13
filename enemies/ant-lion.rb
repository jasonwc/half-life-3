require "./enemies/enemy"

class AntLion < Enemy
  attr_reader :name

  def initialize
    @name = "Antlion"
    @health = 10
    @damage = 12
  end
end
