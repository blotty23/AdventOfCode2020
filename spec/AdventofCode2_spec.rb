require_relative '../AdventofCode2'

context Expenses do
  describe "#split_password" do
    it "takes a row of the password and returns the conditions and the password" do
      # Arrange
      password = Passwords.new
      # Act
      result = password.split_password("7-10 m: xmxmmwtmmmnvcrmkrmmm")
      # Assert
      expect(result).to eq({range: "7-10",letter: "m", pwd_string: "xmxmmwtmmmnvcrmkrmmm"})
    end
  end 
  describe "#max_min_range" do
    it "takes the range from the password and converts to integers min and max" do
      # Arrange
      password = Passwords.new
      # Act
      result = password.max_min_range("7-10")
      # Assert
      expect(result).to eq({:min => 7, :max =>10})
    end
  end
  describe "#does_it_pass?" do
    it "given a password, letter and range, returns true when valid"do
      # Arrange
      password = Passwords.new
      # Act
      result = password.does_it_pass?("7-10", "m","xmxmmwtmmmnvcrmkrmmm")
      # Assert
      expect(result).to eq(true)
    end
    it "given a failing password returns false"do
      # Arrange
      password = Passwords.new
      # Act
      result = password.does_it_pass?("7-10", "m","xmxwtnvcrmkrmmm")
      # Assert
      expect(result).to eq(false)
    end
  end
  describe "#iterate_over_passwords" do
    it "given a list of 1 good password, returns 1" do
      # Arrange
      password = Passwords.new
      list = ["7-10 m: xmxmmwtmmmnvcrmkrmmm"]
      # Act
      result = password.iterate_over_passwords(list)
      # Assert
      expect(result).to eq(1)
    end
    it "given a list of 1 good password, 1 bad, returns 1" do
      # Arrange
      password = Passwords.new
      list = ["7-10 m: xmxmmwtmmmnvcrmkrmmm","2-3 m: xmxmmwtmmmnvcrmkrmmm"]
      # Act
      result = password.iterate_over_passwords(list)
      # Assert
      expect(result).to eq(1)
    end
    it "given a list of 2 good password, 1 bad, returns 2" do
      # Arrange
      password = Passwords.new
      list = ["7-10 m: xmxmmwtmmmnvcrmkrmmm","2-3 m: xmxmmwtmmmnvcrmkrmmm","7-10 m: xmxmmwtmnvcrmkrmmm"]
      # Act
      result = password.iterate_over_passwords(list)
      # Assert
      expect(result).to eq(2)
    end
  end
  describe "#does_it_pass_2" do
    it "returns true when either the first or the second range contains the char" do
      # Arrange
      password = Passwords.new
      # Act
      result = password.does_it_pass_2?("7-10", "m","xmxmmwtmmmnvcrmkrmmm")
      # Assert
      expect(result).to eq(true)
    end
    it "returns false when neight the first or the second range contains the char" do
      # Arrange
      password = Passwords.new
      # Act
      result = password.does_it_pass_2?("1-3", "a","bcdefcga")
      # Assert
      expect(result).to eq(false)
    end
    it "if both are true we should get false" do
      # Arrange
      password = Passwords.new
      # Act
      result = password.does_it_pass_2?("1-3", "a","abadefcgd")
      # Assert
      expect(result).to eq(false)
    end
  end

end
