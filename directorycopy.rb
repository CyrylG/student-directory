@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets
  name.strip!
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
      name = gets
      name.strip!
    else
      puts "Now we have #{@students.count} students"
      name = gets
      name.strip!
    end
  end
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
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu