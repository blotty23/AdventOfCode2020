require_relative '../AdventofCode3'

context Sled do
  describe "#convert_map_to_array" do
    it "changes an string into an array- simple string = ." do
      # Arrange
      string = "."
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq(["."])
    end
    it "changes an string into an array- simple string = .." do
      # Arrange
      string = ".."
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([".","."])
    end
    it "changes an string into an array- simple string = ..#" do
      # Arrange
      string = "..#"
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([".",".","#"])
    end
  end 
end
