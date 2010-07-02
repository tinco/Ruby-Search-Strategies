require 'graph'

class Graph
  # root is the vertex we start searching on, problem takes a vertex as an
  # argument and returns a true value when it is solved
  # the search returns either false or the solution of the problem.
  def self.breadth_first_search(root, problem)
    fringe = [root]
    visited = []
    until fringe.empty?
      fringe.each do |vertex|
        solution = problem[vertex]
        return solution if solution
      end
      visited |= fringe
      fringe = fringe.collect(&:neighbours).flatten - visited
    end
    false
  end
end
