class Expenses
  def load_expenses(filepath)
    IO.read(filepath)
  end

  def convert_to_array(string)
    string.split("\n")
  end

  def check_for_2020?(number1,number2)

  end
end