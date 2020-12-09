require_relative "AdventofCode1"
require_relative "AdventofCode2"

class AdventofCode
  def self.day1
    all_together = AllTogether.new
    expenses = Expenses.new
    puts "two numbers - #{all_together.bring_it_all("data/Day1.txt",expenses)}"
    puts "three numbers - #{all_together.bring_it_all_to_three("data/Day1.txt",expenses)}"
  end

  def self.day2
    password = Passwords.new
    puts "number of correct old passwords: #{password.iterate_over_passwords(password.inital_array_get)}"
    puts "number of correct new passwords: #{password.iterate_over_passwords_2(password.inital_array_get)}"
  end
end


case ARGV[0]
when "day1"
  AdventofCode.day1
when "day2"
  AdventofCode.day2
else
  puts "wrong argument type - you want dayx"
end


