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
    it "checks if numbers = 2020 - false when no" do
      # Arrange
      expenses = Expenses.new
      number1 = 1932
      number2 = 1332
      # Act
      result = expenses.check_for_2020?([number1,number2])
      # Assert
      expect(result).to eq(false)
    end
    it "checks if numbers = 2020 - true when yes" do
      # Arrange
      expenses = Expenses.new
      number1 = 2010
      number2 = 10
      # Act
      result = expenses.check_for_2020?([number1,number2])
      # Assert
      expect(result).to eq(true)
    end
    it "checks if three numbers = 2020 - true when yes" do
      # Arrange
      expenses = Expenses.new
      number1 = 2000
      number2 = 10
      number3 = 10
      # Act
      result = expenses.check_for_2020?([number1,number2,number3])
      # Assert
      expect(result).to eq(true)
    end
  end
  describe "#iterate_over_list" do
    it "given an easy list, returns the two numbers that add to 2020" do
      # Arrange
      expenses = Expenses.new
      list = [2000,20]
      # Act
      result = expenses.iterate_over_list(list)
      # Assert
      expect(result).to eq([2000,20])
    end
    it "given an easy list, returns the two numbers that add to 2020" do
      # Arrange
      expenses = Expenses.new
      list = [40,100,300,20,500,1220,3020,2000]
      # Act
      result = expenses.iterate_over_list(list)
      # Assert
      expect(result).to eq([20, 2000])
    end
  end
  describe "#calculate_multiple" do
    it "returns the multiple of two given numbers" do
      # Arrange
      expenses = Expenses.new
      list = [2000,20]
      # Act
      result = expenses.calculate_multiple(list)
      # Assert
      expect(result).to eq(2000*20)
    end
  end


end 