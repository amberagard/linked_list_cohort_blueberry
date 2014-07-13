class LinkedList
  attr_reader :size

  def initialize(*values)
    @size = 0
    values.each do |value|
      push(value) unless value.nil?
    end
  end

  def push(value)
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
    @size += 1
  end

  def get(index)
    raise IndexError if index < 0 or index >= size
    current_item = @first_item
    index.times do
      current_item = current_item.next_item
    end
    current_item.payload
  end
  alias [] get

  def []=(index, value)
    get(index) == value
  end

  # def index(value)
  #   count = 0
  #   lli = LinkedListItem.new(value)
  #   current_item = @first_item
  #   until current_item.nil?
  #     break if current_item == lli
  #     count += 1
  #     current_item = current_item.next_item
  #   end
  #   current_item == lli ? count : nil
  # end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def to_s
    result = "|"
    item = @first_item
    until item.nil?
      result << " " + item.payload.to_s
      result << "," unless item.last?
      item = item.next_item
    end
    result + " |"
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end
end
