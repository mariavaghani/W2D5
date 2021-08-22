class Item
  
  attr_reader :deadline, :done
  attr_accessor :title, :description

  def self.valid_date?(date_string)
    date_obj = date_string.split('-')
    date_obj.map!(&:to_i)
    return false if date_obj.length != 3 || !(1000..9999).include?(date_obj[0]) || !(1..12).include?(date_obj[1]) || !(1..31).include?(date_obj[2])
    true
  end

  def initialize(title, deadline, description)

    if !Item.valid_date?(deadline)
      raise "the date is invalid"
    end

    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def toggle
    if @done
      @done = false
    else
      @done = true
    end
  end

  def deadline=(deadline)
    if Item.valid_date?(deadline)
      @deadline = deadline
    else
      raise "the date is invalid"
    end
  end

end