require_relative "helpers"

class Passports
  def load_passports(filename)
    Helpers.load_file(filename)
  end
  def split_to_user(string)
    ["hello"]
  end
  def convert_to_hash(array)
    array.to_h
  end
end