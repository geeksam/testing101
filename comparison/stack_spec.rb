require 'rspec'
require File.join(File.dirname(__FILE__), *%w[.. lib stack])

describe Stack do
  describe "an empty stack" do
    subject :stack do
      Stack.new
    end

    it { should be_empty }
    its(:size) { should eq(0) }

    it "should return nil when you peek at the top" do
      expect(stack.peek).to be_nil
    end

    it "should return nil when you pop" do
      expect(stack.pop).to be_nil
    end
  end

  describe "a stack with one item pushed onto it" do
    subject(:stack) do
      Stack.new.tap do |stack|
        stack.push :foo
      end
    end

    it { should_not be_empty }
    its(:size) { should eq(1) }

    it "should return the item when you peek" do
      expect(stack.peek).to eq(:foo)
      expect(stack).to_not be_empty
    end

    it "should let you pop the item, and then be empty" do
      expect(stack.pop).to eq(:foo)
      expect(stack.size).to eq(0)
      expect(stack).to be_empty
    end
  end

  describe "a stack with two items" do
    subject(:stack) do
      Stack.new.tap do |stack|
        stack.push :foo
        stack.push :bar
      end
    end

    it { should_not be_empty }
    its(:size) { should eq(2) }

    it "should return the last-pushed item when you peek" do
      expect(stack.peek).to eq(:bar)
      expect(stack).to_not be_empty
    end

    it "should let you pop the items, and only be empty after the last one has been returned" do
      expect(stack.pop).to eq(:bar)
      expect(stack).to_not be_empty
      expect(stack.pop).to eq(:foo)
      expect(stack).to be_empty
    end
  end
end
