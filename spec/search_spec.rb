require 'spec/spec_helpers'
shared_examples_for "search strategies" do
  before :each do
    v1 = V "v1"
    v2 = V "v2"
    v3 = V "v3"
    v4 = V "v4"
    v5 = V "v5"
    v6 = V "v6"

    E v1, v2
    E v1, v3
    E v2, v4
    E v4, v5
    E v4, v6
    @root = v1
    @vertices = [v1, v2, v3, v4, v5, v6]
  end

  describe "basics" do
    it "should find each node" do
      @vertices.each do |vertex|
        @strategy.call(@root, lambda {|v|v.label == vertex.label ? "success" : false}).should == "success"
      end
    end

    it "should not find an non existant node" do
      @strategy.call(@root, lambda {|v|v.label == "not-a-node"}).should be_false
    end
  end
end
