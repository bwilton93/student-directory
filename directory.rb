@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array of students
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    print "Now we have #{@students.count} "
    if @students.count > 1
      puts "students"
    else
      puts "student"
    end
    # get another name
    name = gets.chomp
  end
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    student_number = index + 1
    puts "#{student_number}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.length == 0
    return
  end

  print "Overall, we have #{@students.count} "
  if @students.count > 1
    puts "great students"
  else
    puts "great student"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we will be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu