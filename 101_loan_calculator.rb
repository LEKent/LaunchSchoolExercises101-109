puts "Welcome to loan calculator"

loop do
  principal = ''
  apr = ''
  duration_years = ''

  loop do
    puts "How much would you like to borrow?"
    principal = gets.chomp

    break if principal > 0
    puts "That's not a valid number. Please try again"
  end

  loop do
    puts "What is the APR? (as a percentage = e.g. 2.9)"
    apr = gets.chomp.to_f

    break if apr > 0

    puts "That is not a valid input. Please try again."
  end

  loop do
    puts "What is the duration of the loan in years?"
    duration_years = gets.chomp.to_f

    break if duration_years > 0
    puts "That is not a valid input. Please try again"
  end

  monthly_interest = (apr / 100) / 12
  number_of_payments = duration_years * 12

  monthly_payment = principal * (monthly_interest / (1 - (1 + monthly_interest)**-number_of_payments))

  puts "Your monthly payment will be $#{format('%02.2f', monthly_payment)}"

  puts "Would you like to do another calculation (y/n)"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

puts "Thanks for using loan calcultor. Good-Bye!"
