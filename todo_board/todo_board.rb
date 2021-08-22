require_relative "list"

class ToDoBoard
  
  def initialize
    @lists = {}
  end

  def new_list(label)
    list = List.new (label)
    if !@lists.has_key?(label)
      @lists[label] = list
    else
      puts "I am sorry this list already exists"
    end
  end

  def ls
    puts @lists.keys
  end

  def showall
    @lists.each { |label, list| list.print  }
  end

  def get_command
    print "\nEnter a command: "
    cmd, label, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      new_list(label)
      return true
    when 'ls'
      ls
      return true
    when 'showall'
      showall
      return true
    when 'mktodo'
      @lists[label].add_item(*args)
      return true
    when "up"
      args.map!(&:to_i)
      @lists[label].up(*args)
      return true
    when 'down'
      args.map!(&:to_i)
      @lists[label].down(*args)
      return true
    when "swap"
      args.map!(&:to_i)
      @lists[label].swap(*args)
      return true
    when 'sort'
      @lists[label].sort_by_date!(*args)
      return true
    when 'priority'
      @lists[label].print_priority
      return true
    when 'purge'
      @lists[label].purge
      return true
    when 'toggle'
      args.map!(&:to_i)
      @lists[label].toggle_item(*args)
      return true
    when 'print'
      if args.empty?
        @lists[label].print
      else
        args.map!(&:to_i)
        @lists[label].print_full_item(*args)
      end
      return true
    when 'rm'
      args.map!(&:to_i)
      @lists[label].remove_item(*args)
      return true
    when 'quit'
      return false
    else
      print "Sorry, that command is not recognized."
    end

    true
  end

  def run
    cmd = get_command
    while cmd
      cmd = get_command
    end
  end
end