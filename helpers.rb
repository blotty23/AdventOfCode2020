class Helpers
  def self.load_file(filepath)
    IO.read(filepath)
  end
  def self.convert_to_array(string)
    string.split("\n")
  end
end