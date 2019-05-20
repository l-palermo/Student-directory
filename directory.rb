# #################################################
# Cp. 8 - Exercise 8
# #################################################

def students_by_cohort(students)
 cohorts = {}
  students.map do |student| 
    if cohorts[student[:cohort]] == nil
      cohorts[student[:cohort]] = []
    end
    cohorts[student[:cohort]] << student[:name]
  end
    cohorts
end

# This sorted hash will be used to print the students belonging to a specific cohort only 
# by user_input, it will also recognize if the cohort entered by the user exist or not.


def print_students_cohort(students)
    sbc = students_by_cohort(students)
    puts "Enter the cohort to see its students "
    cohort = gets.chomp.to_sym
    while !cohort.empty? do
      if sbc.key(sbc[cohort]) == cohort 
        puts "Students from #{cohort}: #{sbc[cohort.to_sym]}"
      else
        puts "The cohort you entered does not exist, please try again"
      end
    puts "Enter the cohort"
    cohort = gets.chomp.to_sym
    end
end

# #################################################

# Array with list of months to check if the user input has a typo
COHORTS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", :unknown]

def print_header
  puts "The students of Villains Academy".center(107, "-")
  puts "--------------------------------".center(107, "-")
end

def print(names)
  student_name = ""
  while student_name != names.last[:name] do
    names.each_with_index do |student, index| 
      puts "#{index + 1}.#{student[:name]}".ljust(30) + " Cohort: #{student[:cohort]}".ljust(25) + " Hobby: #{student[:hobby]}".ljust(20) + " Date_of_birth: #{student[:date_of_birth]}" 
      student_name = student[:name]
    end
  end
end

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
    puts "Enter the cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = :unknown
    end
    while !COHORTS.include?(cohort)
      puts "You made a typo, please type again"
      cohort = gets.chomp
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, date_of_birth: date_of_birth}
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
print_students_cohort(students)