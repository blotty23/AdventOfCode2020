require_relative "helpers"

class Expenses


  def check_for_2020?(list)
    list.reduce(0, :+) == 2020
  end

  def iterate_over_list(list)
    list.each do |key1|
      list.each do |key2|
        return [key1.to_i,key2.to_i] if check_for_2020?([key1.to_i,key2.to_i])
      end 
    end
    false
  end

  def iterate_over_list_three(list)
    list.each do |key1|
      list.each do |key2|
        list.each do |key3|
          return [key1.to_i,key2.to_i,key3.to_i] if check_for_2020?([key1.to_i,key2.to_i,key3.to_i])
        end
      end 
    end
    false
  end

  def calculate_multiple(list)
    list.inject(:*)
  end
end

class AllTogether
  def bring_it_all(filename, expenses)
    string =Helpers.load_file(filename)
  
    array = Helpers.convert_to_array(string)
    # puts array
    winners = expenses.iterate_over_list(array)
    # puts winners
    answer = expenses.calculate_multiple(winners)
  end
  def bring_it_all_to_three(filename, expenses)
    string = Helpers.load_file(filename)
  
    array = Helpers.convert_to_array(string)
    # puts array
    winners = expenses.iterate_over_list_three(array)
    # puts winners
    answer = expenses.calculate_multiple(winners)
  end
end

