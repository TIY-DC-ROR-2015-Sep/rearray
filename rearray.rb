class Node
  def initialize value
    @value = value
  end

  def value
    @value
  end
end

class Rearray
  def initialize
    @start = nil
  end

  def push thing
    node = Node.new thing
    if @start
      i_dont_know
    else
      @start = node
    end
  end

  def first
    @start.value
  end
end
