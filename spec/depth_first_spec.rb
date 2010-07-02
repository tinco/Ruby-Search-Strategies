require 'depth_first'
require 'spec/spec_helpers'
require 'spec/search_spec'

describe Graph do
  describe "#depth_first_search" do
    before :each do
      @strategy = Graph.method(:depth_first_search)
    end

    it_should_behave_like "search strategies"
  end

  describe "#depth_limited_search" do
    before :each do
      @strategy = Graph.method(:depth_limited_search)
    end

    it_should_behave_like "search strategies"

    it "should seek no deeper than depth" do
      vertex = @vertices[0]
      problem = lambda {|v|v.label == vertex.label ? "success" : false}
      Graph.depth_limited_search(@root, problem, 1).should == "success"

      vertex = @vertices[5]

      Graph.depth_limited_search(@root, problem, 1).should == false

      Graph.depth_limited_search(@root, problem, 3).should == "success"
      Graph.depth_limited_search(@root, problem, 6).should == "success"
    end
  end

  describe "#iterative_deepening_search" do
    before :each do
      @strategy = Graph.method(:iterative_deepening_search)
    end

    it_should_behave_like "search strategies"
  end
end
