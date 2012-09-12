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

def test(subject)
  yield subject
end

##### Empty stack #####
test(Stack.new) do |stack|
  assert stack.empty?, "New stack not empty"
end

test(Stack.new) do |stack|
  assert stack.size.zero?, "New stack doesn't have size == 0"
end

test(Stack.new) do |stack|
  assert stack.pop.nil?, "New stack doesn't return nil when you pop"
end

##### Stack with one thing on it #####

test(stack_with(:foo)) do |stack|
  assert !stack.empty?, "Stack with one item is empty"
  assert stack.size == 1, "Stack with one item doesn't have size == 1"
end

test(stack_with(:foo)) do |stack|
  assert stack.peek == :foo, "Stack with one item doesn't have the right thing when you peek"
  assert stack.size == 1, "Stack with one item doesn't have size == 1 after you peek"
end

test(stack_with(:foo)) do |stack|
  assert stack.pop == :foo, "Stack with one item doesn't have the right thing when you pop"
  assert stack.size == 0, "Stack with one item doesn't have size == 0 after you pop"
  assert stack.empty?, "Stack with one item isn't empty after you pop"
end

##### Stack with two things on it #####

test(stack_with(:foo, :bar)) do |stack|
  assert !stack.empty?, "Stack with two items is empty"
  assert stack.size == 2, "Stack with one item doesn't have size == 2"
end

test(stack_with(:foo, :bar)) do |stack|
  assert stack.pop == :bar, "Stack with two items doesn't have the right thing when you pop one"
  assert stack.size == 1, "Stack with two items doesn't have size == 1 after you pop one"
  assert !stack.empty?, "Stack with two items is empty after you pop one"
  assert stack.pop == :foo, "Stack with two items doesn't have the right thing when you pop two"
  assert stack.size == 0, "Stack with two items doesn't have size == 0 after you pop two"
  assert stack.empty?, "Stack with two items isn't empty after you pop two"
end

##### Success! #####

puts "It's all good"
