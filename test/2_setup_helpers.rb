require File.expand_path(File.join(File.dirname(__FILE__), *%w[.. lib stack]))

def assert(truth, failure_message)
  raise failure_message unless truth
end

def stack_with(*items)
  stack = Stack.new
  items.each do |item|
    stack.push item
  end
  stack
end

##### Empty stack #####
stack = Stack.new
assert stack.empty?, "New stack not empty"

stack = Stack.new
assert stack.size.zero?, "New stack doesn't have size == 0"

stack = Stack.new
assert stack.pop.nil?, "New stack doesn't return nil when you pop"

##### Stack with one thing on it #####

stack = stack_with(:foo)
assert !stack.empty?, "Stack with one item is empty"
assert stack.size == 1, "Stack with one item doesn't have size == 1"

stack = stack_with(:foo)
assert stack.peek == :foo, "Stack with one item doesn't have the right thing when you peek"
assert stack.size == 1, "Stack with one item doesn't have size == 1 after you peek"

stack = stack_with(:foo)
assert stack.pop == :foo, "Stack with one item doesn't have the right thing when you pop"
assert stack.size == 0, "Stack with one item doesn't have size == 0 after you pop"
assert stack.empty?, "Stack with one item isn't empty after you pop"

##### Stack with two things on it #####

stack = stack_with(:foo, :bar)
assert !stack.empty?, "Stack with two items is empty"
assert stack.size == 2, "Stack with one item doesn't have size == 2"

stack = stack_with(:foo, :bar)
assert stack.pop == :bar, "Stack with two items doesn't have the right thing when you pop one"
assert stack.size == 1, "Stack with two items doesn't have size == 1 after you pop one"
assert !stack.empty?, "Stack with two items is empty after you pop one"
assert stack.pop == :foo, "Stack with two items doesn't have the right thing when you pop two"
assert stack.size == 0, "Stack with two items doesn't have size == 0 after you pop two"
assert stack.empty?, "Stack with two items isn't empty after you pop two"

##### Success! #####

puts "It's all good"
