def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array of students
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    print "Now we have #{students.count} "
    if students.count > 1
      puts "students"
    else
      puts "student"
    end
    # get another name
    name = gets.chomp
  end
  # return the array of students
  students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(students)
  students.each_with_index do |student, index|
    student_number = index + 1
    puts "#{student_number}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.length == 0
    return
  end

  print "Overall, we have #{names.count} "
  if names.count > 1
    puts "great students"
  else
    puts "great student"
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we will be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_list(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu