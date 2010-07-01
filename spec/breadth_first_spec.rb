require 'breadth_first'
require 'spec/spec_helpers'
require 'spec/search_spec'

describe Graph do
  describe "#breadth_first_search" do
    before :each do
      @strategy = Graph.method(:breadth_first_search)
    end

    it_should_behave_like "search strategies"
  end
end
