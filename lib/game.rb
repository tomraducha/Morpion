require_relative './board'
require_relative '../view/show'

class Game
  # la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :players

  def initialize(player1, player2)
    # créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @players = [player1, player2]
    @board = Board.new
    @status = 'on going'
    @current_player = @players[0]
  end

  def turn
    # TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board).
    # Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    Show.new.show_board(@board)
    @board.play_turn(@current_player)
    victory = @board.victory
    @status =
      if [BoardCase::O, BoardCase::X].include?(victory)
        @players.find { |player| player.symbol == victory }
      else
        victory
      end
    @current_player = @players.find { |player| player.symbol != @current_player.symbol }
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    @players = players
    @board = Board.new
    @status = 'on going'
    @current_player = @players[0]
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if @status == 'nul'
      Show.new.show_board(@board)
      puts('Égalité!')
    elsif @status != 'on going'
      Show.new.show_board(@board)
      puts("#{status.name} a gagné la partie.")
    end
  end
end
