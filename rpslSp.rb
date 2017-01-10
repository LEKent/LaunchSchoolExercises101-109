VALID_CHOICES = %w(r p s l Sp)

# WINNING_COMBOS = {
  # 'r' => %w (s l),
  # 'p' => %w (r Sp),
  # 's' => %w (p l),
  # 'Sp' => %w (s r),
  # 'l' => %w (p Sp)
# }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
# WINNING_COMBOS [first] == second
# end

  # (first == 'p' && second == ('r' || 'Sp')) ||
  # (first == 'r' && second == ('s'|| 'l')) ||
  # (first == 'Sp' && second == ('r' || 's')) ||
  # (first == 's' && second == ('p' || 'l')) ||
  # (first == 'l' && second == ('p' || 'Sp'))

  (first == 'p' && second == 'r') ||
    (first == 'r' && second == 's') ||
    (first == 'r' && second == 'l') ||
    (first == 'Sp' && second == 'r') ||
    (first == 's' && second == 'p') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'Sp') ||
    (first == 's' && second == 'l') ||
    (first == 'Sp' && second == 's') ||
    (first == 'l' && second == 'Sp')
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
