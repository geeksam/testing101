require File.expand_path(File.join(File.dirname(__FILE__), *%w[.. lib stack]))

##### A new stack... #####

# is empty / has size of 0
stack = Stack.new
raise "New stack not empty" unless stack.empty?
raise "New stack doesn't have size == 0" unless stack.size.zero?

# answers nil when sent :pop
stack = Stack.new
raise "New stack doesn't return nil when you pop" unless stack.pop.nil?



##### A stack with one thing on it... #####

# is not empty / has size of 1
stack = Stack.new
stack.push :foo
raise "Stack with one item is empty" if stack.empty?
raise "Stack with one item doesn't have size == 1" unless stack.size == 1

# lets you peek at the top item without changing the stack
stack = Stack.new
stack.push :foo
raise "Stack with one item doesn't have the right thing when you peek" unless stack.peek == :foo
raise "Stack with one item doesn't have size == 1 after you peek" unless stack.size == 1

# lets you pop the top item off, which does change the stack
stack = Stack.new
stack.push :foo
raise "Stack with one item doesn't have the right thing when you pop" unless stack.pop == :foo
raise "Stack with one item doesn't have size == 0 after you pop" unless stack.size == 0
raise "Stack with one item isn't empty after you pop" unless stack.empty?



##### A stack with two things on it... #####

# is not empty / has size of 2
stack = Stack.new
stack.push :foo
stack.push :bar
raise "Stack with two items is empty" if stack.empty?
raise "Stack with one item doesn't have size == 2" unless stack.size == 2

# lets you pop the top item off, which does change the stack
stack = Stack.new
stack.push :foo
stack.push :bar
raise "Stack with two items doesn't have the right thing when you pop one" unless stack.pop == :bar
raise "Stack with two items doesn't have size == 1 after you pop one" unless stack.size == 1
raise "Stack with two items is empty after you pop one" if stack.empty?
raise "Stack with two items doesn't have the right thing when you pop two" unless stack.pop == :foo
raise "Stack with two items doesn't have size == 0 after you pop two" unless stack.size == 0
raise "Stack with two items isn't empty after you pop two" unless stack.empty?



##### Success! #####

puts "It's all good"
