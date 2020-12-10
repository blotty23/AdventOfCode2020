require_relative "AdventofCode1"
require_relative "AdventofCode2"
require_relative "AdventofCode3"
require_relative "AdventofCode4"

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

  def self.day3
    sled = Sled.new
    puts "part 1: #{sled.run_santa_run([1,3])}"
    directions = [[1,1],[1,3],[1,5],[1,7],[2,1]]
    trees = []
    directions.each do |dir|
      sled = Sled.new
      trees << sled.run_santa_run(dir)
    end
    puts "part 2: #{trees.join(",")} \n multiplied: #{trees.inject(:*)}"
  end

  def self.day4
    passports = Passports.new
    puts "part 1: #{passports.how_many_valid_passports("./data/Day4.txt")}"
  end
end


case ARGV[0]
when "day1"
  AdventofCode.day1
when "day2"
  AdventofCode.day2
when "day3"
  AdventofCode.day3
when "day4"
  AdventofCode.day4
else
  puts "wrong argument type - you want dayx"
end


