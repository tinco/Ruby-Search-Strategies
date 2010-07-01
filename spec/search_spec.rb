require 'spec/spec_helpers'
shared_examples_for "search strategies" do
  before :each do
    v1 = V "v1"
    v2 = V "v2"
    v3 = V "v3"
    v4 = V "v4"
    E v1, v2
    E v1, v3
    E v2, v4
    @root = v1
    @vertices = [v1, v2, v3, v4]
  end

  describe "basics" do
    it "should find each node" do
      @vertices.each do |vertex|
        @strategy.call(@root, lambda {|v|v.label == vertex.label}).should == vertex
      end
    end

    it "should not find an non existant node" do
      @strategy.call(@root, lambda {|v|v.label == "not-a-node"}).should be_false
    end
  end
end
