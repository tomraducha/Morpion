require 'bundler'
Bundler.require
require 'pry'

require_relative './board_case'

class Board
  attr_accessor :cases

  # créer 9 instances BoardCases
  def initialize
    @cases = []
    for x in 'a'..'c'
      for y in '1'..'3'
        @cases << BoardCase.new("#{x}#{y}", BoardCase::EMPTY)
      end
    end
  end

  # Permet de retourner la case qui a le nom correspondant (case_name)
  def get_case_by_name(case_name)
    return @cases.find { |c| c.name == case_name }
  end

  # changer la valeur de la case en X ou O en fonction du joueur
  def play_turn(player)
    is_case_valid = false
    until is_case_valid
      puts("#{player.name}, sur quelle case veux-tu placer ton #{player.symbol} ?")
      position = gets.chomp
      # if position == ("a1") || position == ("a2") || position == ("a3") ||...
      if %w[a1 a2 a3 b1 b2 b3 c1 c2 c3].include?(position)
        selected_case = get_case_by_name(position)
        if selected_case.empty?
          selected_case.content = player.symbol
          is_case_valid = true
        else
          puts('La case est déjà prise.')
        end
      else
        puts('La case n\'existe pas.')
      end
    end
  end

  # une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  def victory
    # Vérification des lignes (ex. A1-A2-A3) qui ont le même symbole
    is_victory = check_all_rows_victory
    return is_victory if is_victory != false

    # Vérification des colonnes (ex. A1-B1-C1) qui ont le même symbole
    is_victory = check_all_columns_victory
    return is_victory if is_victory != false

    # Vérification diagonale (ex. A1-B2-C3) qui a le même symbole
    is_victory = check_diagonal_victory(0, 8)
    return is_victory if is_victory != false

    # Vérification diagonale (ex. A3-B2-C1) qui a le même symbole
    is_victory = check_diagonal_victory(2, 6)
    return is_victory if is_victory != false

    # si toutes les cases sont remplies, retourne une égalité
    if @cases.select { |c| !c.empty? }
             .count == 9

      return 'nul'
    end

    return 'on going'
  end

  def check_row_or_col_victory(start_index, padding)
    symbol = @cases[start_index].content
    if symbol != BoardCase::EMPTY && @cases[start_index + padding].equals(symbol) && @cases[start_index + (padding * 2)].equals(symbol)
      return symbol
    end

    return false
  end

  def check_diagonal_victory(first_case_index, last_case_index)
    symbol = @cases[first_case_index].content
    return symbol if symbol != BoardCase::EMPTY && @cases[4].equals(symbol) && @cases[last_case_index].equals(symbol)

    return false
  end

  def check_all_rows_victory
    for ligne_index in 0..2
      case_index = ligne_index * 3
      result = check_row_or_col_victory(case_index, 1)
      return result if result != false
    end
    return false
  end

  def check_all_columns_victory
    for column_index in 0..2
      result = check_row_or_col_victory(column_index, 3)
      return result if result != false
    end
    return false
  end

  def board_clean
    @cases.each { |c| c.content = BoardCase::EMPTY }
  end
end

# board = Board.new
# binding.pry

# board.cases[0].content = BoardCase::X
# board.cases[1].content = BoardCase::X
# board.cases[2].content = BoardCase::X
# board.cases[8].content = BoardCase::X
# binding.pry

# board.board_clean
# binding.pry
