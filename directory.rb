# first we print the list of students
students = [
 ["Dr. Hannibal Lecter", :november],
 ["Darth Vader", :november],
 ["Nurse Ratched", :november],
 ["Michael Corleone", :november],
 ["Alex DeLarge", :november],
 ["The Wicked Wich of the West", :november],
 ["Terminator", :november],
 ["Freddy Krueger", :november],
 ["The Joker", :november],
 ["Joffrey Baratheon", :november],
 ["Norman Bates", :november]
]
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(names)
names.each do |student| puts "#{student[0]} (#{student[1]} cohort)" end
end
def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
# nothing happens untill we call the methods
print_header
print(students)
print_footer(students) 