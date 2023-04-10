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

# nothing happens until we call the methods
students = input_students
print_header
print_list(students)
print_footer(students)