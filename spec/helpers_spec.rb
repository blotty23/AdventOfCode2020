require_relative '../helpers'

context Helpers do
  describe "#load_file" do
    it "loads in data from file" do
      # Act
      result = Helpers.load_file("spec/hello_world.txt")
      # Assert
      expect(result).to eq("hello world!")
    end
  end
end