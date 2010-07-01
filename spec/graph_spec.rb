require 'graph'
require 'spec/spec_helpers'

describe Graph do
  describe "#from_csv" do
    describe "basics" do
      before(:each) do
        csv = "v1, v2 \n v2, v3 \n v2, v4 \n v1, v3"
        @graph = Graph.from_csv(csv)
      end

      it "should have every vertex" do
        @graph.vertices.collect {|k, v|v.label}.should == %w(v1 v2 v3 v4)
      end

      it "should have every edge" do
        @graph.vertices["v1"].neighbours.collect(&:label).should == %w(v2 v3)
        @graph.vertices["v2"].neighbours.collect(&:label).should == %w(v1 v3 v4)
      end
    end
  end
end

describe Vertex do
  describe "#new" do
    it "should make a new vertex with no edges and a label" do
      vertex = Vertex.new("v1")
      vertex.label.should == "v1"
    end
  end

  describe "#neighbours" do
    it "should return all neigbhouring vertices" do
      v1 = V "v1"
      v2 = V "v2"
      e = E v1, v2
    end
  end
end

describe Edge do
  describe "#new" do
    it "should create a new edge out of two vertices" do
      v1 = Vertex.new("v1")
      v2 = Vertex.new("v2")
      e = Edge.new(v1, v2)
      e.left.should == v1
      e.right.should == v2
    end

    it "should make the vertices neighbours of eachother" do
      v1 = Vertex.new("v1")
      v2 = Vertex.new("v2")
      e = Edge.new(v1, v2)
      v1.neighbours.should include(v2)
      v2.neighbours.should include(v1)
      v1.neighbours.should_not include(v1)
      v1.neighbours.should_not include(v1)
    end
  end
end
