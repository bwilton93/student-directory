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

def print_names(students)
  print "Search alphabetically (hit return to show all names): "
  letter = gets.downcase.chomp
  students.each_with_index do |student, index|
    student_number = index + 1
    if student[:name][0].downcase == letter || letter.empty?
      puts "#{student_number}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)