def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(n)
  return n.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip()
  if(!move(board, input_to_index(input)))
    turn(board)
  end
  display_board(board)
end

def move(board, index, value = "X")
  if(valid_move?(board, index))
    board[index] = value
    return true
  end
  return false
end

def position_taken?(board, index)
  if(board[index] == "X" || board[index] == "O")
    return true
  end
end

def valid_move?(board, index)
  if((index > -1 && index < 9) && !position_taken?(board, index))
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  i = 0
  while(i < 9) do
    turn(board)
    i+=1
  end
end
