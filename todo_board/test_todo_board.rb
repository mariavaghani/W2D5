require_relative "todo_board"

puts "TESTING VALID DATE"
puts "======================================================================================"
p Item.valid_date?('2019-10-25') # true
p Item.valid_date?('1912-06-23') # true
p Item.valid_date?('2018-13-20') # false
p Item.valid_date?('2018-12-32') # false
p Item.valid_date?('10-25-2019') # false

my_item1 = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

puts "TESTING ADDING NEW ITEMS"
puts "======================================================================================"

my_item2 = Item.new(
    'Buy Cheese',
    '2019-10-21',
    'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)
begin
  
  Item.new(
      'Fix checkout page',
      '10-25-2019',
      'The font is too small.'
  ) # raises error due to invalid date
rescue => exception
  puts "The Item was not created because " + exception.message
end

puts "TESTING SETTERS AND GETTERS, INVALID DATES"
puts "======================================================================================"
p my_item1.title
my_item1.description = 'It loads waaaaaay too slow!'
p my_item1



begin
  my_item1.deadline = "10-23-2019"
  # raises error due to invalid date
  puts "deadline was changed!"
rescue => exception
  puts "The deadline was not set because " + exception.message
end

p my_item1.deadline
my_item1.deadline = "2019-10-23"
p my_item1.deadline
p my_item1

puts "TESTING LIST"
puts "======================================================================================"

my_list = List.new('Groceries')

p "SIZE", my_list.size

puts "TESTING ITEMS TO LIST"
puts "======================================================================================"

p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
p my_list.add_item('toothpaste', '2019-10-25')
puts [my_list.add_item('shampoo', '10-24-2019'), "SHOULD BE FALSE"].join(" ") # invalid date
p my_list.add_item('shampoo', '2019-10-24')
p my_list.add_item('candy', '2019-10-31', '4 bags should be enough')

puts "TESTING LIST NOW"
puts "======================================================================================"

p my_list
p "SIZE", my_list.size

puts "TESTING PRIORITY"
puts "======================================================================================"

p my_list.priority

puts "TESTING SWAP"
puts "======================================================================================"

p my_list.swap(0, 2)

p my_list.priority

puts "LIST"
puts "======================================================================================"
p my_list

puts "TESTING BRACKET"
puts "======================================================================================"

puts "TESTING SWAP"
puts "======================================================================================"

puts [my_list.swap(1,  7), "SHOULD BE FALSE"].join(" ") # invalid index 7
# p my_list[15]

my_list.print

p my_list.swap(1, 3)
my_list.print #


puts "TESTING PRINT"
puts "======================================================================================"


my_list.print
puts "TESTING ITEM"
puts "======================================================================================"


my_list.print_full_item(2)

puts "TESTING print priority"
puts "======================================================================================"


my_list.print_priority

puts "TESTING UP"
puts "======================================================================================"

my_list.print
my_list.up(2, 1)
my_list.print # move one

my_list.up(3, 5)
my_list.print # toothpaste should become on top

my_list.up(6, 5)
my_list.print # not change, return false

puts "TESTING DOWN"
puts "======================================================================================"

my_list.print
my_list.down(2, 1)
my_list.print # move one

my_list.down(1, 5)
my_list.print # shampoo should become on bottom

my_list.down(6, 5)
my_list.print # not change, return false

my_list.down(2)
my_list.print # not change, return false

puts "TESTING SORT_BY_DATE"
puts "======================================================================================"

p my_list.add_item('babies', '2019-09-03', 'a small one')
p my_list.add_item('brushes', '2021-08-13', 'good ones')
p my_list.add_item('flour', '2019-01-05', '4 bags should be enough')
my_list.toggle_item(2)

my_list.print
my_list.sort_by_date!
my_list.print 
my_list.toggle_item(1)

my_list.print_full_item(1)

my_list.print_full_item(0)
my_list.print_priority


puts "TESTING delete"
puts "======================================================================================"

my_list.print
my_list.remove_item(2)
my_list.print

todo = ToDoBoard.new

todo.run

# puts "commands to enter"
# puts "+++++++++++++++++++++++++++++++++++++++"

# # mktodo groceries 2019-10-24
# puts "+++++++++++++++++++++++++++++++++++++++"

# p todo

/
mklist groceries
mklist tech
ls
mktodo groceries cheese 2019-10-25 foooooood
mktodo groceries toothpaste 2019-10-23
mktodo groceries candy 2019-10-31 sugar-free
mktodo groceries shampoo 2019-10-25
mktodo groceries cereal 2019-11-03
mktodo groceries milk 2019-11-03 soso

mktodo tech ruby 2019-10-24
mktodo tech rails 2019-11-02
mktodo tech javascript 2019-11-30
showall

print groceries 2
toggle groceries 2
toggle groceries 1
toggle tech 2

print groceries
purge groceries
rm groceries 3
print groceries
sort groceries
print groceries
swap groceries 0 2
print groceries
print groceries 1
priority groceries
down groceries 0
print groceries
up groceries 3 2
print groceries
/
