# Terraces
#
# https://open.kattis.com/problems/terraces

require 'set'

module Input
  extend self

  def grid(lines)
    x, y =
      numbers(lines.shift)

    Array.new(y) do
      numbers(lines.shift)
    end
  end

  private

  def numbers(string)
    string
      .scan(/[[:digit:]]+/)
      .map(&:to_i)
  end
end

class Garden
  def initialize(grid)
    @grid = grid

    @x = @grid.last.size
    @y = @grid.size
  end

  def water_pools
    pools = []

    each_coordinate do |i, j|
      next if pools.include?([i, j])

      traversal =
        flow_traversal(i, j)

      is_pool = traversal.all? do |k, l|
        height(k, l) >= height(i, j)
      end

      pools += traversal if is_pool
    end

    pools
  end

  private

  def each_coordinate
    0.upto(@y - 1) do |i|
      0.upto(@x - 1) do |j|
        yield i, j
      end
    end
  end

  def flow_traversal(y, x)
    queue = [[y, x]]
    set   = Set.new([[y, x]]) # Set.new autosplats

    until queue.empty?
      neighbours =
        flow_neighbours(*queue.pop)

      neighbours.each do |k, l|
        queue << [k, l] if set.add?([k, l])
      end
    end

    set.to_a
  end

  def height(i, j)
    @grid[i][j]
  end

  def inbound?(i, j)
    i.between?(0, @y - 1) && j.between?(0, @x - 1)
  end

  def flow_neighbours(i, j)
    directions = [
      [i - 1, j],
      [i + 1, j],
      [i, j - 1],
      [i, j + 1]
    ]

    directions.filter do |k, l|
      inbound?(k, l) &&
        height(k, l) <= height(i, j)
    end
  end
end

garden = Garden.new(
  Input.grid(ARGF.readlines)
)

square_meters =
  garden
  .water_pools
  .size

puts(square_meters)
