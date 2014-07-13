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
    payload = self.payload
    compare = compare.payload

    # self.payload.to_s <=> compare.payload.to_s

    if payload.class == compare.class
      payload <=> compare
    else
      importance = [Fixnum, String, Symbol]
      index1 = importance.index(payload.class)
      index2 = importance.index(compare.class)
      index1 <=> index2
    end
  end

  def ===(compare)
    self.equal? compare
  end
end
