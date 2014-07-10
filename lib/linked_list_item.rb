class LinkedListItem
  include Comparable

  attr_reader :payload
  attr_reader :next_item

  def initialize(value)
    @payload = value
  end

  def next_item=(other_item)
    raise ArgumentError, "Can't set self as next item" if other_item === self
    @next_item = other_item
  end

  def last?
    @next_item.nil?
  end

  def <=>(compare)
    self.payload <=> compare.payload
  end

  def ===(compare)
    self.equal? compare
  end
end
