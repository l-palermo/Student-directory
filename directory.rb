# #################################################
# Cp. 8 - Exercise 2
# #################################################

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# #################################################

def print(names, letter)
  names.each_with_index do |student, index| 
    puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
  end
  puts "Students whose name start with #{letter}"
end

# #################################################

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeate this code
  while !name.empty? do 
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # returns the array of students
  students
end 

# nothing happens untill we call the methods
students = input_students
print_header
print(students, "D")
print_footer(students)