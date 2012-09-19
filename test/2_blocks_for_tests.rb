require File.expand_path(File.join(File.dirname(__FILE__), *%w[.. lib stack]))

class TestEnvironment
  def initialize(context_description)
    @context_description = context_description
  end

  def assert(truth, failure_message)
    message = "#{@context_description} #{failure_message}"
    raise message unless truth
  end
end

def test(context_description, &block)
  test_env = TestEnvironment.new(context_description)
  test_env.instance_eval(&block)
end

##### Empty stack #####
test "New stack" do
  stack = Stack.new
  assert stack.empty?, "is not empty"
end

test "New stack" do
  stack = Stack.new
  assert stack.size.zero?, "doesn't have size == 0"
end

test "New stack" do
  stack = Stack.new
  assert stack.pop.nil?, "doesn't return nil when you pop"
end

##### Stack with one thing on it #####

test "Stack with one item" do
  stack = Stack.new
  stack.push :foo
  assert !stack.empty?, "is empty"
  assert stack.size == 1, "doesn't have size == 1"
end

test "Stack with one item" do
  stack = Stack.new
  stack.push :foo
  assert stack.peek == :foo, "doesn't have the right thing when you peek"
  assert stack.size == 1, "doesn't have size == 1 after you peek"
end

test "Stack with one item" do
  stack = Stack.new
  stack.push :foo
  assert stack.pop == :foo, "doesn't have the right thing when you pop"
  assert stack.size == 0, "doesn't have size == 0 after you pop"
  assert stack.empty?, "isn't empty after you pop"
end

##### Stack with two things on it #####

test "Stack with two items" do
  stack = Stack.new
  stack.push :foo
  stack.push :bar
  assert !stack.empty?, "is empty"
  assert stack.size == 2, "doesn't have size == 2"
end

test "Stack with two items" do
  stack = Stack.new
  stack.push :foo
  stack.push :bar
  assert stack.pop == :bar, "doesn't have the right thing when you pop one item"
  assert stack.size == 1, "doesn't have size == 1 after you pop one item"
  assert !stack.empty?, "is empty after you pop one item"
  assert stack.pop == :foo, "doesn't have the right thing when you pop two items"
  assert stack.size == 0, "doesn't have size == 0 after you pop two items"
  assert stack.empty?, "isn't empty after you pop two items"
end


##### Success! #####

puts "It's all good"
