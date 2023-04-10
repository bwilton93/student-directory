@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    append_students(name)
    print "Now we have #{@students.count} "
    if @students.count > 1
      puts "students"
    else
      puts "student"
    end
    name = STDIN.gets.chomp
  end
end 

def append_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    print "Selection: "
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the students array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    append_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if the file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if the file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu