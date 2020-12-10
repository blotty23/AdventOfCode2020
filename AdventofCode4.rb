require_relative "helpers"

class Passports
  attr_accessor :valid_count
  def initialize()
    @valid_count = 0
  end
  def load_passports(filename)
    Helpers.load_file(filename)
  end
  def split_to_user(string)
    string.split("\n\n")
  end
  def clean_single_user(string)
    array = string.split(/\n|\s/)
    user_array = []
    array.each do |value|
      user_array << value.split(":")
    end
    return user_array.to_h
  end
  def verify_passport(passport_hash)
    @verifiers = ["hcl","iyr","eyr","ecl","pid","byr","hgt"]
    @verifiers.each do |ver|
      return false if !passport_hash.key?(ver)
      verifier = Verifiers.verifier_factory(ver)
      return false if verifier.verify(passport_hash[ver])
    end
  @valid_count = @valid_count +1
  true
  end

  def how_many_valid_passports(filename)
    string = load_passports(filename)
    users = split_to_user(string)
    users.each do |user|
      cleaned_user = clean_single_user(user)
      verify_passport(cleaned_user)
    end
    return @valid_count
  end

end

class Verifiers
  def self.verifier_factory(verifier)
    case verifier
    when "byr"
      V_byr.new
    when "iyr"
      V_iyr.new
    when "eyr"
      V_eyr.new
    when "hgt"
      V_hgt.new
    end
  end
end

class V_byr
  def verify(value)
    value.length == 4 && value > 1920 && value < 2002
  end
end
class V_iyr
  def verify(value)
    value.length == 4 && value > 2010 && value < 2020

  end
end
class V_eyr
  def verify(value)
    value.length == 4 && value > 2020 && value < 2030

  end
end
class V_hgt
  def verify(value)
    
    
  end
end