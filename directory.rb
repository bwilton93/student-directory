@students = [] # an empty array accessible to all methods

def new_line
  puts
end

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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we will be adding more items
  new_line
end

def show_students
  print_header
  print_students_list
  print_footer
  new_line
end

def process(selection)
  new_line
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    get_file_name
    load_students(@filename)
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

  new_line
  print "Overall, we have #{@students.count} "
  if @students.count > 1
    puts "great students"
  else
    puts "great student"
  end
end

def save_students
  get_file_name
  File.open(@filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    save_message(@filename)
  end
end

def load_students(filename)
  if !File.exist?(@filename)
    puts "Sorry that file does not exist"
  else
    @students = []
    File.open(@filename, "r") do |file|
      file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
        append_students(name, cohort)
      end
      load_message(@filename)
      new_line
    end
  end
end

def try_load_students
  @filename = ARGV.first # first argument from the command line 
  
  if @filename.nil?
    @filename = "students.csv"
  end

  if File.exist?(@filename) # if the file exists
    load_students(@filename)
  else # if the file doesn't exist
    puts "Sorry, #{@filename} doesn't exist."
    exit
  end
end

def load_message(filename)
  puts "Loaded #{@students.count} students from #{@filename}"
end

def save_message(filename)
  puts "Saved #{@students.count} students to #{@filename}"
end

def get_file_name
  print "Enter filename (default = students.csv): "
  @filename = STDIN.gets.chomp
  
  if @filename.empty?
    @filename = "students.csv"
  end
end

try_load_students
interactive_menu