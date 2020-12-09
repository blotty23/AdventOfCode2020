require_relative "helpers"

class Passwords
  def initialize
    @inital_string = Helpers.load_file("data/Day2.txt")
    puts @inital_string
  end

end