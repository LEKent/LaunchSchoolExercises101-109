puts "Welcome to loan calculator"

loop do
  loan_amt = ''
  apr = ''
  duration_years = ''

  loop do
    puts "How much would you like to borrow?"
    loan_amt = gets.chomp.gsub(/[^(0-9)]/, '').to_i
# I've added the #gsub method since when
# testing I'd enter lg numbers with
# comma e.g 15,000. But when entered like this it
# wouldn't be interpreted as 15,000. I searched for a
# solution and found this piece of code and read the
# documentation. I understand that it's identifying
# a pattern (first arg) and every time that pattern is
# found it is to be substituted with the second argument.
# What I don't understand is what ['^(0-9)]' means.From
# the context I gather that it's saying that any
# character that is not a 0-9 is to be replaced with ''.
# But what's the '^' character mean. I thought !
# meant not.

    break if loan_amt > 0
    puts "That's not a valid number. Please try again"
  end

  loop do
    puts "What is the APR? (as a percentage = e.g. 2.9)"
    apr = gets.chomp.to_f

    break if apr > 0
  # I want to validate the input here to rule out
  # alpha characters. The drawback is that it cannot handle
  # any loans at a 0% interest rate. Is there another
  # way to validate the input that wouldn't rule out
  # calculating payments on interest free loans?

    puts "That is not a valid input. Please try again."
  end

  loop do
    puts "What is the duration of the loan in years?"
    duration_years = gets.chomp.to_f

    break if duration_years > 0
    puts "That is not a valid input. Please try again"
  end

  yearly_interest = (loan_amt * (apr / 100))
  total_interest = (duration_years * yearly_interest)
  total_loan = (loan_amt + total_interest)
  monthly_payment = (total_loan / (duration_years * 12))

  puts "Your monthly payment will be $#{format('%02.2f', monthly_payment)}"
  puts "The total interest you will pay on this loan is
  $#{format('%02.2f', total_interest)}"

# I'd like the output to have a comma or space between
# the thousand and the hundred spot. I suspect the solution
# lies in formatting. I looked at the documentation
# and haven't yet figured out an obvious way to do this.
# I've also looked online and the suggested solutions seem
# quite cumbersome. Is there a simple way to do this?

  puts "Would you like to do another calculation (y/n)"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

puts "Thanks for using loan calcultor. Good-Bye!"
