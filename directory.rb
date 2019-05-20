# #################################################
# Cp. 8 - Exercise 12
# #################################################

# Added conditional for empty array

# Array with list of months to check if the user input has a typo
COHORTS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", :unknown]

def students_count(students)
  if students.empty?
  elsif students.length <= 1
    puts "Now we have #{students.count} student"
  else
    puts "Now we have #{students.count} students"
  end
end

def print_header(names)
  if names.empty?
  else
    puts "The students of Villains Academy".center(107, "-")
    puts "--------------------------------".center(107, "-")
  end
end

def print(names)
  if names.empty?
  else
    student_name = ""
    while student_name != names.last[:name] do
      names.each_with_index do |student, index| 
        puts "#{index + 1}.#{student[:name]}".ljust(30) + " Cohort: #{student[:cohort]}".ljust(25) + " Hobby: #{student[:hobby]}".ljust(20) + " Date_of_birth: #{student[:date_of_birth]}" 
        student_name = student[:name]
      end
    end
  end
end

def print_footer(students)
students_count(students)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter the name"
  name = gets.delete!("\n")
  # while the name is not empty, repeate this code
  while !name.empty? do
    puts "Enter the hobby"
    hobby = gets.delete!("\n")
    puts "Enter the date of birth"
    date_of_birth = gets.delete("\n")
    puts "Enter the cohort"
    cohort = gets.delete!("\n")
    if cohort.empty?
      cohort = :unknown
    end
    while !COHORTS.include?(cohort)
      puts "You made a typo, please type again"
      cohort = gets.delete!("\n")
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, date_of_birth: date_of_birth}
    students_count(students)
    # get another name from the user
    name = gets.delete!("\n")
  end
  # returns the array of students
  students
end 

# nothing happens untill we call the methods
students = input_students
print_header(students)
print(students)
print_footer(students)