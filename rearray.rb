class Node
  attr_accessor :next, :value

  def initialize value
    self.value = value
  end
end

class Rearray
  def initialize
    @start = nil
    @last  = nil
  end

  def push thing
    node = Node.new thing
    if @start
      @last.next = node
      @last = node
    else
      @start = node
      @last  = node
    end
  end

  def size
    return 0 unless @start
    curr  = @start
    count = 1
    while curr != @last
      curr = curr.next
      count += 1
    end
    count
  end

  def first
    @start.value
  end
end
