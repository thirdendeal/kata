# Weak Vertices
#
# https://open.kattis.com/problems/weakvertices

def graph_iterator(lines)
  until lines.first == "-1\n"
    removed = lines.shift(
      lines.shift.to_i
    )

    graph = removed.map do |line|
      line.split.map(&:to_i)
    end

    yield graph
  end
end

# No linked-to-vertex links to any linked-to-vertex?

def weak_vertex?(vertex, graph)
  indices =
    vertex.each_index.filter do |index|
      vertex[index] == 1
    end

  indices.none? do |i|
    indices.any? do |j|
      graph[i][j] == 1
    end
  end
end

lines = ARGF.readlines

graph_iterator(lines) do |graph|
  indices = graph.each_index.filter do |index|
    vertex = graph[index]

    weak_vertex?(vertex, graph)
  end

  puts(indices.join(' '))
end
