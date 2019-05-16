# first we print the list of students
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Wich of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(names)
names.each do |student| puts student end
end
def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
# nothing happens untill we call the methods
print_header
print(students)
print_footer(students) 