require_relative 'boardcase'
require_relative 'player'
require 'pry'

class Board
  attr_accessor :array_case

  @@array_case = []

  # créer 9 instances BoardCases
  def initialize
    for y in '1'..'3'
      for x in 'a'..'c'
        @@array_case << BoardCase.new("#{x + y}", ' ')
      end
    end
  end

  def play_turn(_player)
    # changer la valeur de la case en X ou O en fonction du joueur
    def play_turn(symbol)
      position = gets.chomp
      # if position == ("a1") || position == ("a2") || position == ("a3") ||...
      if %w[a1 a2 a3 b1 b2 b3 c1 c2 c3].include?(position)
        if position == 'a1' && @@array_case[0] == ' '
          @@array_case[0] = symbol
        else
          position == 'a1' && (@@array_case[0] == 'X' || @@array_case[0] == 'O')
          puts('')
        end
        if position == 'a2' && @@array_case[3] == ' '
          @@array_case[3] = symbol
        else
          position == 'a2' && (@@array_case[3] == 'X' || @@array_case[3] == 'O')
          puts('')
        end
        if position == 'a3' && @@array_case[6] == ' '
          @@array_case[6] = symbol
        else
          position == 'a3' && (@@array_case[6] == 'X' || @@array_case[6] == 'O')
          puts('')
        end
        if position == 'b1' && @@array_case[1] == ' '
          @@array_case[1] = symbol
        else
          position == 'b1' && (@@array_case[1] == 'X' || @@array_case[1] == 'O')
          puts('')
        end
        if position == 'b2' && @@array_case[4] == ' '
          @@array_case[4] = symbol
        else
          position == 'b2' && (@@array_case[4] == 'X' || @@array_case[4] == 'O')
          puts('')
        end
        if position == 'b3' && @@array_case[7] == ' '
          @@array_case[7] = symbol
        else
          position == 'b3' && (@@array_case[7] == 'X' || @@array_case[7] == 'O')
          puts('')
        end
        if position == 'c1' && @@array_case[2] == ' '
          @@array_case[2] = symbol
        else
          position == 'c1' && (@@array_case[2] == 'X' || @@array_case[2] == 'O')
          puts('')
        end
        if position == 'c2' && @@array_case[5] == ' '
          @@array_case[5] = symbol
        else
          position == 'c2' && (@@array_case[5] == 'X' || @@array_case[5] == 'O')
          puts('')
        end
        if position == 'c3' && @@array_case[8] == ' '
          @@array_case[8] = symbol
        else
          position == 'c3' && (@@array_case[8] == 'X' || @@array_case[8] == 'O')
          puts('')
        end
      else
        puts('')
      end
    end
  end

  def victory?
    # TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end
end
