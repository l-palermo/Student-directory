# #################################################
# Cp. 8 - Exercise 6
# #################################################

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# #################################################

def print(names)
  student_name = ""
  while student_name != names.last[:name] do
    names.each_with_index do |student, index| 
      puts "#{index + 1}.#{student[:name]}".ljust(30) + " Cohort: #{student[:cohort]}".ljust(25) + " Hobby: #{student[:hobby]}".ljust(20) + " Date_of_birth: #{student[:date_of_birth]}" 
      student_name = student[:name]
    end
  end
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
  puts "Enter the name"
  name = gets.chomp
  # while the name is not empty, repeate this code
  while !name.empty? do
    puts "Enter the hobby"
    hobby = gets.chomp
    puts "Enter the date of birth"
    date_of_birth = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, date_of_birth: date_of_birth}
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
print(students)
print_footer(students)