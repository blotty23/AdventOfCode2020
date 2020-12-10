require_relative '../AdventofCode4'

context Passports do
  describe "#split_to_user" do
    it "doesnt split if no double backslash" do
      # Arrange
      password = Passports.new
      # Act
      result = password.split_to_user("hello")
      # Assert
      expect(result).to eq(["hello"])
    end
    it "splits on double backslash n" do
      # Arrange
      password = Passports.new
      # Act
      result = password.split_to_user("hello\n\nworld")
      # Assert
      expect(result).to eq(["hello","world"])
    end
    it "splits on double backslash n and not single backslash" do
      # Arrange
      password = Passports.new
      # Act
      result = password.split_to_user("hello\n\nworld\n!")
      # Assert
      expect(result).to eq(["hello","world\n!"])
    end
  end
  describe "#clean_single_user" do
    it "splits a string of single user data into an array" do
      # Arrange
      password = Passports.new
      # Act
      result = password.clean_single_user("iyr:2013 ecl:amb\nhcl:#cfa07d")
      # Assert     
      expect(result).to eq({"iyr"=>"2013","ecl"=>"amb","hcl"=>"#cfa07d"})
    end
  end
  describe "#verify_passport" do
    it "returns false if missing any single parameter" do
      # Arrange
      password = Passports.new
      # Act
      result = password.verify_passport({hi: "hello there", there: "this is a test"})
      # Assert
      expect(result).to eq(false)
    end
    it "returns true if all parameters (excluding cid) are there" do
      # Arrange
      password = Passports.new
      # Act
      result = password.verify_passport({"hcl"=>"#ae17e1", "iyr"=>"2013", "eyr"=>"2024", "ecl"=>"brn", "pid"=>"760753108", "byr"=>"1931", "hgt"=>"179cm"})
      # Assert
      expect(result).to eq(true)
    end
    it "ups the valid count if all parameters (excluding cid) are there" do
      # Arrange
      password = Passports.new
      # Act
      password.verify_passport({"hcl"=>"#ae17e1", "iyr"=>"2013", "eyr"=>"2024", "ecl"=>"brn", "pid"=>"760753108", "byr"=>"1931", "hgt"=>"179cm"})
      result = password.valid_count 
      # Assert
      expect(result).to eq(1)
    end
    it "ups the valid count twice if all parameters (excluding cid) are there twice" do
      # Arrange
      password = Passports.new
      # Act
      password.verify_passport({"hcl"=>"#ae17e1", "iyr"=>"2013", "eyr"=>"2024", "ecl"=>"brn", "pid"=>"760753108", "byr"=>"1931", "hgt"=>"179cm"})
      password.verify_passport({"hcl"=>"#ae17e1", "iyr"=>"2013", "eyr"=>"2024", "ecl"=>"brn", "pid"=>"760753108", "byr"=>"1931", "hgt"=>"179cm"})
      result = password.valid_count 
      # Assert
      expect(result).to eq(2)
    end
    it "valid count doesnt change if not valid" do
      # Arrange
      password = Passports.new
      # Act
      password.verify_passport({"hcl"=>"#ae17e1", "iyr"=>"2013", "eyr"=>"2024", "ecl"=>"brn", "pid"=>"760753108", "byr"=>"1931", "hgt"=>"179cm"})
      before = password.valid_count
      password.verify_passport({hi: "hello there", there: "this is a test"})
      result = password.valid_count 
      # Assert
      expect(result).to eq(before)
    end
  end
  describe "#how_many_valid_passports" do
    it "given some test data, returns the expected number" do
      # Arrange
      password = Passports.new
      # Act
      result = password.how_many_valid_passports("./data/Day4_easyData.txt")
      
      # Assert
      expect(result).to eq(2)
    end
  end
end