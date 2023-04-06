students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :december},
  {name: "Nurse Ratched", cohort: :december},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :december},
  {name: "Freddy Krueger", cohort: :december},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_by_cohort(students)
  values = students.map { |student| [student["name"], student[:cohort]]}.uniq
  puts "which of these cohorts would you like to display"
  puts values
  choice = gets.chomp
  students.each do |student|
    if student[:cohort] == choice.to_sym
      puts student[:name]
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


print_by_cohort(students)