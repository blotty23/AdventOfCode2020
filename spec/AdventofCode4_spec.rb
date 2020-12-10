require_relative '../AdventofCode4'

context Passports do
  describe "#split_to_user" do
    it "splits on double backslash n" do
      # Arrange
      password = Passports.new
      # Act
      result = password.split_to_user("hello")
      # Assert
      expect(result).to eq(["hello"])
    end
  end
  describe "#convert_to_hash" do
    xit "takes an array and splits on backslash n" do
      # Arrange
      password = Passports.new
      # Act
      result = password.convert_to_hash([ [:hi,"hello there"],[:there, "this is a test"] ])
      # Assert
      expect(result).to eq({hi: "hello there", there: "this is a test"})
    end
  end
end