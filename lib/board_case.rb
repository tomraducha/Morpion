# Case
class BoardCase
  X = 'X'
  O = 'O'
  EMPTY = ' '

  attr_accessor :content, :name

  def initialize(name, content)
    # le nom de la case A1, A2...
    @name = name

    # ce que la case va afficher (X, O, rien)
    @content = content
  end

  # Retourne vrai si la case est vide
  def empty?
    return @content == BoardCase::EMPTY
  end

  # Retourne vrai si le @content est égal à symbol
  # ex. pour une case c qui contient X => c.equals(BoardCase::X) = true
  # ex. pour une case c qui contient X => c.equals(BoardCase::O) = false
  def equals(symbol)
    return @content == symbol
  end
end
