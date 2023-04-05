def input_students
  puts "Please enter the name of the first student"
  students = []
  name = gets.chomp
  while !name.empty? do
    while true do
      puts "Please enter cohort of student"
      cohort = gets.chomp
      if cohort == "november" || cohort == "december"
        break
      elsif cohort == ""
        cohort = "default"
        break
      else 
        cohort.to_sym!
        puts "Invalid input, try again"
      end
    end
    students << {name: name, cohort: cohort, grade: 80}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student"
    puts "To finish, just hit return again"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  count = 0
  while count < students.count do 
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort) grade: #{students[count][:grade]}".center(100)
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)