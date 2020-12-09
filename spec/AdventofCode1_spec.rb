require_relative '../AdventofCode1'

context Expenses do
  describe "#load_expenses" do
    it "loads in data from file" do
      # Arrange
      expenses = Expenses.new
      # Act
      result = expenses.load_expenses("spec/hello_world.txt")
      # Assert
      expect(result).to eq("hello world!")
    end
    it "loads in multiline data" do
      # Arrange
      expenses = Expenses.new
      # Act
      result = expenses.load_expenses("spec/multiline_hello_world.txt")
      # Assert
      expect(result).to eq("hello\nworld\n!")
    end
  end 
  describe "#convert_to_array" do
    it "splits multiline data to array" do
      # Arrange
      expenses = Expenses.new
      # Act
      result = expenses.load_expenses("spec/multiline_hello_world.txt")
      converted_result = expenses.convert_to_array(result)
      # Assert
      expect(converted_result).to eq(["hello","world","!"])
    end
  end 
  describe "#convert_to_array" do
    it "splits multiline data to array" do
      # Arrange
      expenses = Expenses.new
      # Act
      result = expenses.load_expenses("spec/multiline_hello_world.txt")
      converted_result = expenses.convert_to_array(result)
      # Assert
      expect(converted_result).to eq(["hello","world","!"])
    end
  end 
  describe "#check_for_2020?" do
    it "checks if numbers = 2020" do
      # Arrange
      expenses = Expenses.new
      number1 = 1932
      number2 = 1332
      # Act
      result = expenses.check_for_2020?(number1,number2)
      # Assert
      expect(result).to eq(false)
    end
  end 
end 