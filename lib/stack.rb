class Stack
  def initialize
    @array = []
  end

  def empty?
    @array.empty?
  end

  def size
    @array.size
  end

  def peek
    @array.first
  end

  def push(thing)
    @array.unshift thing
  end

  def pop
    @array.shift
  end
end
