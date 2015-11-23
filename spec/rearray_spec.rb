require "spec_helper"
require "pry"
require_relative "../rearray"

describe Rearray do
  Given(:arr)  { Rearray.new }

  context "it can add items" do
    When { arr.push 1 }

    Then { arr.first == 1 }
  end

  context "it knows its size" do
    When { arr.push :a }
    When { arr.push :b }
    When { arr.push :c }

    Then { arr.size == 3 }
  end

  context "it can get items by position" do
    When { arr.push :a }
    When { arr.push :b }
    When { arr.push :c }

    Then { arr[0] == :a  }
    And  { arr[1] == :b  }
    And  { arr[2] == :c  }
    And  { arr[3] == nil }
  end

  context "it can find the index of items" do
    When { arr.push :a }
    When { arr.push :b }
    When { arr.push :c }

    Then { arr.index(:a) == 0   }
    And  { arr.index(:c) == 2   }
    And  { arr.index(:z) == nil }
  end

  context "it can join together strings" do
    When { arr.push :a }
    When { arr.push :b }
    When { arr.push :c }

    Then { arr.join(", ") == "a, b, c" }
  end

  context "has a default to_s" do
    When { arr.push 1 }
    When { arr.push 2 }
    When { arr.push 3 }

    Then { arr.to_s == "[1, 2, 3]" }
  end

  context "it can find items using a block" do
    When { arr.push  1 }
    When { arr.push 27 }
    When { arr.push  6 }
    When { arr.push  7 }
    When { arr.push  8 }
    When { arr.push 98 }

    Then { arr.find { |n| n.even? } == 6 }
    And  { arr.find { |n| n > 10 } == 27 }
  end

  context "it can map" do
    When { arr.push  1 }
    When { arr.push 27 }
    When { arr.push  6 }
    When { arr.push  7 }
    When { arr.push  8 }
    When { arr.push 98 }

    When(:result) { arr.map { |n| n * 2 } }

    Then { result.count == 6    }
    And  { result.first == 2    }
    And  { result.last  == 196  }
    And  { result.is_a? Rearray }
  end
end
