require_relative "helpers"

class Sled
  attr_accessor :tree_count
  def initialize()
    @tree_count = 0
    @position = [0,0]
  end
  def import_map(filename)
    Helpers.load_file(filename)
  end

  def convert_map_to_array(string)
    grid = []
    lines = string.split("\n")
    lines.each do |line|
      grid << line.split("")
    end
    grid
  end

  def move_sled(current_position, shift, map)
    row = current_position[0] + shift[0]
    column = current_position[1] + shift[1]
    if column >= map[0].size
      column = column % map[0].size
    end
    return [row,column]
  end

  def return_tile(map,position)
    [map[position[0]][position[1]]].join
  end

  def check_for_tree(tile)
    @tree_count = @tree_count +1 if tile == "#"
  end

  def check_for_end(position,map)
    position[0] >= map.size
  end

  def run_santa_run(direction)
    @direction = direction
    string = import_map("data/Day3.txt")
    @map = convert_map_to_array(string)
    while 
      @position = move_sled(@position,@direction,@map)
      return @tree_count if check_for_end(@position,@map)
      tile = return_tile(@map,@position)
      # puts @tree_count
      check_for_tree(tile)
    end
  end
end

