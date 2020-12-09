require_relative '../helpers'

context Helpers do
  describe "#load_file" do
    it "loads in data from file" do
      # Act
      result = Helpers.load_file("spec/hello_world.txt")
      # Assert
      expect(result).to eq("hello world!")
    end
    it "loads in multiline data" do
      # Act
      result = Helpers.load_file("spec/multiline_hello_world.txt")
      # Assert
      expect(result).to eq("hello\nworld\n!")
    end
  end 
  describe "#convert_to_array" do
    it "splits multiline data to array" do
      # Act
      result = Helpers.load_file("spec/multiline_hello_world.txt")
      converted_result = Helpers.convert_to_array(result)
      # Assert
      expect(converted_result).to eq(["hello","world","!"])
    end
  end
end