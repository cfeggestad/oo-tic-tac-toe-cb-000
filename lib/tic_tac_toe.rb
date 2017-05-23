class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
    return token

  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end




  # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def turn_count
    count = 0
    @board.each do |turns|
      count += 1 if turns != " "
    end
    count
  end

  def current_player
    if turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      taken = combo.all? do |pos|
        position_taken?(pos)
      end
      if (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && taken)
        return combo
          end
    end
    return false
  end

  def winner2
    if draw? == true || over? == false
      return nil
    else
      letter = won?(@board[0])
      return @board[letter[0]]
  end
  end


  def winner
    win_pos = won?
    if (win_pos)
      return @board[win_pos[0]]
    else
      return nil
    end
  end

  def full?
    @board.each { |b| return false if b == " "}
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end


    def over?
      if (won?|| full? || draw?)
        return true
      else
        return false
      end
    end



  # Define your play method below

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    end
      if won?
        if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end

      end
end
end
