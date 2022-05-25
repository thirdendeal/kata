# Weak Vertices
#
# https://open.kattis.com/problems/weakvertices

def vertices_iterator(lines)
  until lines.first == "-1\n"
    chunk = lines.shift(
      lines.shift.to_i
    )

    vertices = chunk.map do |line|
      line.split.map(&:to_i)
    end

    yield vertices
  end
end

def weak_vertex?(vertex, vertices)
  indices =
    vertex.each_index.filter do |index|
      vertex[index] == 1
    end

  # No linked-to-vertex links to any linked-to-vertex?

  indices.none? do |i|
    indices.any? do |j|
      vertices[i][j] == 1
    end
  end
end

lines = ARGF.readlines

vertices_iterator(lines) do |vertices|
  indices =
    vertices.each_index.filter do |index|
      vertex = vertices[index]

      weak_vertex?(vertex, vertices)
    end

  puts(indices.join(' '))
end
