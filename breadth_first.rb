require 'graph'

class Graph
  # root is the vertex we start searching on, problem takes a vertex as an
  # argument and returns a true value when it is solved
  # the search returns either false or the solution of the problem.
  def self.breadth_first_search(root, problem)
    fringe = [root]
    visited = []
    until fringe.empty?
      solution = fringe.detect {|vertex| problem[vertex]}
      visited |= fringe
      return solution if solution
      fringe = fringe.collect(:neighbours).flatten - visited
    end
  end
end
