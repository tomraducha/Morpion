class Player
  attr_accessor :name, :symbol

  # régle son nom et sa valeur
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
