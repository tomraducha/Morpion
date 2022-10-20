class Show
  def show_board(board)
    # affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)

    @final_table = board.cases
    puts
    puts("   #{@final_table[0].content}   |    #{@final_table[1].content}   |   #{@final_table[2].content}")
    puts('----------------------------')
    puts("   #{@final_table[3].content}   |    #{@final_table[4].content}   |   #{@final_table[5].content}")
    puts('----------------------------')
    puts("   #{@final_table[6].content}   |    #{@final_table[7].content}   |   #{@final_table[8].content}")
    puts
    puts('***********************************')
    puts
  end
end
