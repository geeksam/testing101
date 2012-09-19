Feature: Stack behaves like a stack

Scenario: Empty stack is empty
  Given a new stack
  Then the stack is empty

Scenario: Empty stack has size zero
  Given a new stack
  Then the stack has size 0



Scenario: A stack with one element is not empty
  Given a stack with: foo
  Then the stack is not empty
  And the stack has size 1

Scenario: A stack with one element lets you peek at the top element
  Given a stack with: foo
  When I peek at the top of the stack
  Then I see foo

Scenario: A stack with one element lets you pop the top element off
  Given a stack with: foo
  When I pop the stack
  Then I have foo
  And the stack is empty
  And the stack has size 0



Scenario: A stack with two elements is not empty
  Given a stack with: foo, bar
  Then the stack is not empty
  And the stack has size 2

Scenario: A stack with two elements lets you pop elements until it is empty
  Given a stack with: foo, bar
  
  When I pop the stack
  Then I have bar
  And the stack is not empty
  And the stack has size 1
  
  When I pop the stack
  Then I have foo
  And the stack is empty
  And the stack has size 0

