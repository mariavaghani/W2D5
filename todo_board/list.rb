require_relative "item"

class List
  
  attr_accessor :label


  List_width = 50
  Col1_w = 7
  Col3_w = 15
  Col2_w = List_width - Col3_w - Col1_w
  Col1_name = "Index"
  Col2_name = "Item"
  Col3_name = "Deadline"

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = "")

    if Item.valid_date?(deadline)
      new_item = Item.new(title, deadline, description)
      @items << new_item
      return true
    end
    false
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if @items[index] == nil
    true
  end

  def swap(index_1, index_2)
    if valid_index?(index_1) && valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      return true
    else
      return false
    end
  end

  def [](index)
    return @items[index] if valid_index?(index)
  end

  def priority
    @items[0]
  end

  def print
    puts "-"*List_width
    puts @label.upcase.center(List_width)
    puts "-"*List_width
    puts "#{Col1_name.ljust(Col1_w)}| #{Col2_name.ljust(Col2_w)}| #{Col3_name.ljust(Col3_w)}"
    puts "-"*List_width
    @items.each_with_index do |item, idx|
      puts "#{idx.to_s.ljust(Col1_w)}| #{item.title.ljust(Col2_w)}| #{item.deadline.ljust(Col3_w)}"
    end
    puts "-"*List_width

  end

  def print_full_item(index)
    if valid_index?(index)
      puts "-"*List_width
      puts @items[index].title.ljust(List_width/2) + @items[index].deadline.rjust(List_width/2)
      puts @items[index].description
      puts "-"*List_width
    end
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount=1)
    amount.times do
      if index-1 >= 0
        swapped = swap(index, index-1)
        return false if !swapped
        index -= 1
      end
    end
  end

  def down(index, amount=1)
    amount.times do
      swapped = swap(index, index+1)
      return false if !swapped
      index += 1
    end
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline.split('-').join("").to_i }
  end
end