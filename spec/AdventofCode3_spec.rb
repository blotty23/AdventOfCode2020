require_relative '../AdventofCode3'

context Sled do
  describe "#convert_map_to_array" do
    it "changes an string into a 2D array- simple string = ." do
      # Arrange
      string = "."
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([["."]])
    end
    it "changes an string into a 2D array- simple string = .." do
      # Arrange
      string = ".."
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([[".","."]])
    end
    it "changes an string into a 2D array- simple string = ..#" do
      # Arrange
      string = "..#"
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([[".",".","#"]])
    end
    it "changes an string into a 2D array- multiline string = ..# ..#" do
      # Arrange
      string = "ABC\nDEF"
      sled = Sled.new
      # Act
      result = sled.convert_map_to_array(string)
      # Assert
      expect(result).to eq([["A","B","C"],["D","E","F"]])
    end
  end 
  describe "#return_tile" do
    it "returns the sled position map tile - origin" do
      # Arrange
      sled = Sled.new
      map = [["0","1","2"],["3","4","5"],["6","7","8"],["9","A","B"],["C","D","E"],["F","G","H"]]
      position = [0,0]
      # Act
      result = sled.return_tile(map, position)
      # Assert
      expect(result).to eq("0")
    end
    it "moves the sled position map tile origin - 3 down, 2 over" do
      # Arrange
      sled = Sled.new
      map = [
              ["0","1","2"],
              ["3","4","5"],
              ["6","7","8"],
              ["9","A","B"],
              ["C","D","E"],
              ["F","G","H"]
            ]
      position = [2,1]
      # Act
      result = sled.return_tile(map, position)
      # Assert
      expect(result).to eq("7")
    end
  end
  describe "#move_sled" do
    it "moves the sled and returns the new sled position & map tile" do
      # Arrange
      sled = Sled.new
      map = [
        ["0","1","2"],
        ["3","4","5"],
        ["6","7","8"],
        ["9","A","B"],
        ["C","D","E"],
        ["F","G","H"]
      ]
      position = [0,0]
      direction =[3,1]
      # Act
      result = sled.move_sled(position,direction,map)
      # Assert
      expect(result).to eq([3,1])
    end
    it "loops around when the sled hits the RHS" do
      # Arrange
      sled = Sled.new
      position = [1,2]
      direction =[3,1]
      map = [
        ["0","1","2"],
        ["3","4","5"],
        ["6","7","8"],
        ["9","A","B"],
        ["C","D","E"],
        ["F","G","H"]
      ]
      # Act
      result = sled.move_sled(position,direction,map)
      # Assert
      expect(result).to eq([4,0])
    end
    it "loops around when the sled hits the RHS" do
      # Arrange
      sled = Sled.new
      position = [1,2]
      direction =[3,1]
      map = [
        ["0","1","2"],
        ["3","4","5"],
        ["6","7","8"],
        ["9","A","B"],
        ["C","D","E"],
        ["F","G","H"]
      ]
      # Act
      result = sled.move_sled(position,direction,map)
      # Assert
      expect(result).to eq([4,0])
    end
  end
  describe "#check_for_tree" do
    it "checks the map tile for a tree doesnt affect tree_count when not tree" do
      # Arrange
      sled = Sled.new
      tile = "."
      # Act
      sled.check_for_tree(tile)
      result = sled.tree_count
      # Assert
      expect(result).to eq(0)
    end
    it "checks the map tile for a tree and ups the tree count if it is" do
      # Arrange
      sled = Sled.new
      tile = "#"
      # Act
      sled.check_for_tree(tile)
      result = sled.tree_count
      # Assert
      expect(result).to eq(1)
    end
    it "counts multiple trees" do
      # Arrange
      sled = Sled.new
      tree = "#"
      not_tree ="."
      # Act
      sled.check_for_tree(tree)
      sled.check_for_tree(tree)
      sled.check_for_tree(not_tree)
      sled.check_for_tree(tree)
      sled.check_for_tree(not_tree)
      sled.check_for_tree(tree)
      result = sled.tree_count
      # Assert
      expect(result).to eq(4)
    end
  end
  describe "#check_for_end" do
    it "returns false if the sled has not reached the end" do
      # Arrange
      sled = Sled.new
      position = [1,2]
      map = [
        ["0","1","2"],
        ["3","4","5"],
        ["6","7","8"],
        ["9","A","B"],
        ["C","D","E"],
        ["F","G","H"]
      ]
      # Act
      result = sled.check_for_end(position,map)
      # Assert
      expect(result).to eq(false)
    end
    it "returns true if the sled has reached the end" do
      # Arrange
      sled = Sled.new
      position = [6,2]
      map = [
        ["0","1","2"],
        ["3","4","5"],
        ["6","7","8"],
        ["9","A","B"],
        ["C","D","E"],
        ["F","G","H"]
      ]
      # Act
      result = sled.check_for_end(position,map)
      # Assert
      expect(result).to eq(true)
    end
  end

end
