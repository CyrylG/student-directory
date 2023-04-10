require 'CSV'

@students = []

def add_student_to_array(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"
  while !name.empty? do
    add_student_to_array(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
      name = STDIN.gets.chomp
    else
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
    end
  end
  puts "Successfully input students!"
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
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
    puts "See you next time!"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "Which file should the students be saved to?"
  file_name = STDIN.gets.chomp
  CSV.open(file_name, 'w') do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Students saved successfully!"
end

def load_students(filename = "students.csv")
  puts "Which file would you like to load?"
  file_name = STDIN.gets.chomp
  CSV.foreach(file_name) do |line|
    name, cohort = line
    add_student_to_array(name, cohort)
  end
  puts "Students loaded successfully!"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv"
  else
    if File.exist?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end
end

try_load_students
interactive_menu