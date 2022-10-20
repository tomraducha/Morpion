require_relative 'lib/game'
require_relative 'lib/board_case'
require_relative 'lib/player'
require 'pry'
require 'bundler'
Bundler.require

class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    #
    puts('Joueur 1: Quel est ton nom?')
    player1 = Player.new(gets.chomp, BoardCase::X)
    puts('Joueur 2: Quel est ton nom?')
    player2 = Player.new(gets.chomp, BoardCase::O)
    continue_playing = true
    game = Game.new(player1, player2)
    while continue_playing == true
      game.new_round
      game.turn while game.status == 'on going'
      game.game_end
      puts('Voulez-vous refaire une partie (O/n)?')
      continue_playing = gets.chomp != 'n'
    end
  end
end

Application.new.perform
