def months_list
    months = [
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december'
  ]

  return months
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  months = months_list

  # create empty array of students
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    cohort = ''
    while !months.include?(cohort)
      print "Cohort: "
      cohort = gets.downcase.chomp
      if !months.include?(cohort)
        puts "Invalid month"
      end 
    end

    students << {name: name, cohort: cohort.to_sym}
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

def alphabetical_search(students)
  print "Search alphabetically (hit return to show all names): "
  letter = gets.downcase.chomp
  students.each_with_index do |student, index|
    student_number = index + 1
    if student[:name][0].downcase == letter || letter.empty?
      puts "#{student_number}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def cohort_search(students)
  months = months_list
  
  # Create list of students sorted by cohort
  students_by_cohort = {}

  students.each do |student|
    cohort = student[:cohort]

    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end

    students_by_cohort[cohort].push(student[:name])
  end
  
  month = ''
  
  while !months.include?(month)
    print "Which cohort would you like to check? "
    month = gets.downcase.chomp
    if !months.include?(month)
      puts "Invalid month"
    end 
  end
  
  month = month.to_sym
  if !students_by_cohort[month].nil?
    students_by_cohort[month].each_with_index do |student, index|
      puts "#{index + 1}. #{student} (#{month} cohort)"
    end
  else
    puts "No students found for this cohort"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  while true
    print "Would you like to search alphabetically, or by cohort: "
    input = gets.downcase.chomp
    if input == "alphabetically" || input == ''
      alphabetical_search(students)
      break
    elsif input == "cohort"
      cohort_search(students)
      break
    end
  end
end

def print_footer(names)
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
print_names(students)
print_footer(students)