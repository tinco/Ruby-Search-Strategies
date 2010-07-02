require 'graph'

class Graph
  # root is the vertex we start searching on, problem takes a vertex as an
  # argument and returns a true value when it is solved
  # the search returns either false or the solution of the problem.
  def self.depth_first_search(root, problem)
    fringe = [root]
    visited = []
    until fringe.empty?
      vertex = fringe.pop

      visited << vertex

      solution = problem[vertex]
      return solution if solution

      fringe |= vertex.neighbours - visited
    end
    false
  end

  # this depth first search shouldn't search deeper than the given
  # limit
  def self.depth_limited_search(root, problem, limit=1.0/0)
    fringe = [[root, 0]]
    visited = []
    until fringe.empty?
      vertex, depth = fringe.pop

      visited << vertex

      solution = problem[vertex]
      return solution if solution

      if (depth < limit)
        depth += 1
        fringe |= (vertex.neighbours - visited).map! {|v|[v, depth]}
      end
    end
    false
  end

  def self.iterative_deepening_search(root, problem)
    fringe = [root]
    visited = []
    past_fringe = []
    until fringe.empty?
      vertex = fringe.pop

      visited << vertex
      past_fringe << vertex

      solution = problem[vertex]
      return solution if solution

      if fringe.empty?
        fringe = past_fringe.collect(&:neighbours).flatten - visited
        past_fringe = []
      end
    end
    false
  end
end
