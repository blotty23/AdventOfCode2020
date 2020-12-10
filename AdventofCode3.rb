require_relative "helpers"

class Sled
  def import_map(filename)
    Helpers.load_file(filename)
  end

  def convert_map_to_array(string)
    string.split("")
  end
end