require_relative "helpers"

class Passwords
  def initialize
    @inital_string = Helpers.load_file("data/Day2.txt")
    @inital_array = Helpers.convert_to_array(@inital_string)
  end

  def inital_array_get
    @inital_array
  end

  def split_password(password_row)
    split_pwd = password_row.split(/\:\s|\s/)
    range = split_pwd[0]
    letter = split_pwd[1]
    password = split_pwd[2]
    return {range: range, letter: letter, pwd_string: password}
  end

  def max_min_range(range)
    min_max = range.split("-")
    min = min_max[0].to_i
    max = min_max[1].to_i
    return {min: min, max: max}
  end

  def does_it_pass?(range,letter,password)
    range = max_min_range(range)
    count = password.count(letter)
    count >= range[:min] && count <= range[:max]
  end

  def does_it_pass_2?(range,letter,password)
    range = max_min_range(range)
    (password[range[:min]-1] == letter) ^ (password[range[:max]-1] == letter)
  end

  def iterate_over_passwords(list)
    count = 0
    list.each do |item|
      pwd_dict = split_password(item)
      count = count +1 if does_it_pass?(pwd_dict[:range], pwd_dict[:letter], pwd_dict[:pwd_string])
    end
    return count
  end

  def iterate_over_passwords_2(list)
    count = 0
    list.each do |item|
      pwd_dict = split_password(item)
      count = count +1 if does_it_pass_2?(pwd_dict[:range], pwd_dict[:letter], pwd_dict[:pwd_string])
    end
    return count
  end
end
