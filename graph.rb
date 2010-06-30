class Graph
  attr_accessor :vertices

  def initialize(vertices, weighted = false, directed = false)
    @vertices = vertices
    @weighted = weighted
    @directed = directed
  end

  def edges
    @vertices.collect(:edges).flatten.uniq
  end
end

class Vertex
  attr_accessor :edges
  attr_accessor :label

  def initialize(label)
    @label = label
    @edges = []
  end

  def neighbours
    @edges.collect {|e|e.left == self ? e.right : e.left }.uniq
  end

  def inspect
    "<Vertex: #{@label.inspect}>"
  end
end

class Edge
  attr_accessor :vertices

  def initialize(left, right, weight = false, directed = false)
    @vertices = [left, right]
    left.edges << self
    right.edges << self
    @weight = weight
    @directed = directed
  end

  def left
    vertices.first
  end

  def right
    vertices.last
  end

  def directed?
    @directed
  end

  def weighted?
    @weight
  end

  def weight
    @weight
  end
end

class DirectedEdge
  def initialize(left, right, weight = false)
    super(left, right, weight, true)
  end
end
