class LinkedList

  def initialize(*payloads)
    payloads.each do |payload|
      push(payload)
    end
  end

  def sorted?
    item = @first_item
    until item.nil? or item.last?
      return false if item > item.next_item
      item = item.next_item
    end
    true
  end

  def sort!
    if size < 2
      self
    else
      count = size - 1
      item = @first_item
      index = 0

      while true
        swap = false
        count.times do
          if item > item.next_item
            swap_with_next(index)
            swap = true
          else
            item = item.next_item
          end
          index += 1
        end
        break unless swap
        index = 0
        item = @first_item
      end
    end
    self
  end

  def swap_with_next(index)
    raise IndexError if index < 0 || index >= size - 1
    if index == 0
      first = @first_item
      second = first.next_item
      first.next_item = second.next_item
      second.next_item = first
      @first_item = second
    else
      current_item = @first_item
      count = index - 1
      count.times do
        current_item = current_item.next_item
      end
      previous = current_item
      first = previous.next_item
      second = first.next_item

      previous.next_item = second
      first.next_item = second.next_item
      second.next_item = first
    end
  end

  def []=(index, payload)
    item = get_item(index)
    item.payload = payload
  end

  def [](index)
    get_item(index).payload
  end

  alias get []

  def delete(index)
    raise IndexError if index > size
    if index == 0
      @first_item = @first_item.next_item
    else
      previous_item = get_item(index - 1)
      next_item = previous_item.next_item.next_item
      previous_item.next_item = next_item
    end
  end

  def index(payload)
    index = -1
    current_item = @first_item
    until current_item.nil?
      index += 1
      return index if current_item.payload == payload
      current_item = current_item.next_item
    end
    nil
  end

  def push(value)
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def last
    return unless @first_item
    last_item.payload
  end

  ## How could we do this more efficiently?
  def size
    i = 0
    current_item = @first_item
    until current_item.nil?
      i += 1
      current_item = current_item.next_item
    end
    i
  end

  def to_s
    result = "|"
    current_item = @first_item
    until current_item.nil?
      result << " #{current_item.payload}"
      unless current_item.last?
        result << ","
      end
      current_item = current_item.next_item
    end
    result << " |"
    result
  end

  private

  def get_item(index)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_item
    end
    current_item
  end

  def last_item
    return unless @first_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end
end

# class LinkedList
#   attr_reader :size
#
#   def initialize(*values)
#     @size = 0
#     values.each do |value|
#       push(value) unless value.nil?
#     end
#   end
#
#   def push(value)
#     lli = LinkedListItem.new(value)
#     if @first_item
#       last_item.next_item = lli
#     else
#       @first_item = lli
#     end
#     @size += 1
#   end
#
#   def get(index)
#     raise IndexError if index < 0 or index >= size
#     current_item = @first_item
#     index.times do
#       current_item = current_item.next_item
#     end
#     current_item.payload
#   end
#
#   alias [] get
#
#   def []=(index, payload)
#     item = get(index)
#     index.times do
#       current_item = current_item.next_item
#     end
#     # item = payload
#   end
#
#   def [](index)
#     get(index)
#   end
#
#   def last
#     if size == 0
#       nil
#     else
#       get(size - 1)
#     end
#   end
#
#   def to_s
#     result = "|"
#     item = @first_item
#     until item.nil?
#       result << " " + item.payload.to_s
#       result << "," unless item.last?
#       item = item.next_item
#     end
#     result + " |"
#   end
#
#   private
#
#   def last_item
#     current_item = @first_item
#     until current_item.last?
#       current_item = current_item.next_item
#     end
#     current_item
#   end
# end
