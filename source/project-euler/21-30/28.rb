# Number spiral diagonals
# ----------------------------------------------------------------------
#
# https://projecteuler.net/problem=28

def spiral_populate(matrix, x, y, cycle, sequence)
  matrix[x][y] = sequence.next

  1.step do |length|
    2.times do
      direction = cycle.next

      length.times do
        x, y = move(direction, x, y)

        return unless matrix[x][y]

        matrix[x][y] = sequence.next
      end
    end
  end
end

# ----------------------------------------------------------------------

def move(direction, x, y)
  case direction
  when :right then [x, y + 1]
  when :down  then [x + 1, y]
  when :left  then [x, y - 1]
  when :up    then [x - 1, y]
  end
end

# ----------------------------------------------------------------------

def anti_diagonal(square_matrix)
  diagonal(square_matrix.map(&:reverse))
end

def diagonal(square_matrix)
  range = 0...square_matrix.size

  range.map do |index|
    square_matrix[index][index]
  end
end

# ----------------------------------------------------------------------

matrix_order = 1001

square_matrix = Array.new(matrix_order) do
  Array.new(matrix_order) { 0 }
end

# ----------------------------------------------------------------------

center_x = square_matrix.size / 2
center_y = center_x

# ----------------------------------------------------------------------

spiral_populate(
  square_matrix,
  center_x,
  center_y,
  [:right, :down, :left, :up].cycle,
  1.step
)

# ----------------------------------------------------------------------

diagonal = diagonal(square_matrix)
anti_diagonal = anti_diagonal(square_matrix)

center = square_matrix[center_x][center_y]

# ----------------------------------------------------------------------

puts(diagonal.sum + anti_diagonal.sum - center) # => 669171001
