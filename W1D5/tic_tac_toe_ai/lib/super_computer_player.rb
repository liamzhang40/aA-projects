require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer


  def move(game, mark)
    root = TicTacToeNode.new(game.board, mark)

    possible_nodes = root.children

    win_node = possible_nodes.find {|node| winning_node?(mark)}

    return win_node.prev_move_pos if win_node

    win_node = possible_nodes.find {|node| !losing_node?(mark)}

    return win_node.prev_move_pos if win_node


  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
