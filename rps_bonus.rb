VALID_CHOICES = %w(r p s l Sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'p' && (second == 'r' || second == 'Sp')) ||
    (first == 'r' && (second == 's' || second == 'l')) ||
    (first == 'Sp' && (second == 'r' || second == 's')) ||
    (first == 's' && (second == 'p' || second == 'l')) ||
    (first == 'l' && (second == 'p' || second == 'Sp'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

choice = ''

loop do
  player_win = 0
  computer_win = 0
  tie = 0

  loop do
    loop do
      prompt("Choose one: Rock (r), Paper (p) Scissors (s)
      Lizard (l) or Spock (Sp)")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    if win?(choice, computer_choice)
      player_win += 1
    elsif win?(computer_choice, choice)
      computer_win += 1
    else
      tie += 1
    end

    display_results(choice, computer_choice)

    prompt("You have won #{player_win}, computer has won #{computer_win}, and
    there have been #{tie} ties.")

    break if player_win == 5 || computer_win == 5
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Good-Bye")
