require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), *%w[.. lib stack]))

class TestEmptyStack < Test::Unit::TestCase
  def setup
    @stack = Stack.new
  end

  def test_new_stack_is_empty
    assert @stack.empty?
  end

  def test_new_stack_has_size_zero
    assert_equal 0, @stack.size
  end

  def test_returns_nil_when_you_pop
    assert_nil @stack.pop
  end
end

class TestStackWithOneElement < Test::Unit::TestCase
  def setup
    @stack = Stack.new
    @stack.push :foo
  end

  def test_is_not_empty
    assert !@stack.empty?
    assert_equal 1, @stack.size
  end

  def test_peek
    assert_equal :foo, @stack.peek
    assert_equal 1, @stack.size
  end

  def test_pop
    assert_equal :foo, @stack.pop, "doesn't have the right thing when you pop"
    assert_equal 0, @stack.size, "doesn't have size == 0 after you pop"
    assert @stack.empty?, "isn't empty after you pop"
  end
end

class TestStakcWithTwoElements < Test::Unit::TestCase
  def setup
    @stack = Stack.new
    @stack.push :foo
    @stack.push :bar
  end

  def test_is_not_empty
    assert !@stack.empty?
    assert_equal 2, @stack.size
  end

  def test_pop
    assert_equal :bar, @stack.pop, "doesn't have the right thing when you pop one item"
    assert_equal 1, @stack.size, "doesn't have size == 1 after you pop one item"
    assert !@stack.empty?, "is empty after you pop one item"

    assert_equal :foo, @stack.pop, "doesn't have the right thing when you pop two items"
    assert_equal 0, @stack.size, "doesn't have size == 0 after you pop two items"
    assert @stack.empty?, "isn't empty after you pop two items"
  end
end
