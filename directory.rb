# #################################################
# Refactoring
# #################################################

@students = []

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu 
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    process(selection)
  end
end

# #################################################

# Array with list of months to check if the user input has a typo
COHORTS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", :unknown]

def students_count
  if @students.empty?
  elsif @students.length <= 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
end

def print_header
  if @students.empty?
  else
    puts "The students of Villains Academy".center(107, "-")
    puts "--------------------------------".center(107, "-")
  end
end

def print_student_list
  if @students.empty?
  else
    student_name = ""
    while student_name != @students.last[:name] do
      @students.each_with_index do |student, index| 
        puts "#{index + 1}.#{student[:name]}".ljust(30) + " Cohort: #{student[:cohort]}".ljust(25) + " Hobby: #{student[:hobby]}".ljust(20) + " Date_of_birth: #{student[:date_of_birth]}" 
        student_name = student[:name]
      end
    end
  end
end

def print_footer
students_count
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, date_of_birth: date_of_birth}
    students_count
    # get another name from the user
    name = gets.delete!("\n")
  end
end 

# nothing happens untill we call the methods
interactive_menu