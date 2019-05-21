# #################################################
# Cp.14 Exercise 4
# #################################################

@students = []

@filename = "students.cvs"

def check_file_exist_and_load
  if File.exist?(@filename) # if it exists
    load_students
    load_confirmation_message
  else # if it doesn't exist
    puts "Sorry, #{@filename} doesn't exist"
    exit # quit the program
  end
end

def load_confirmation_message
  puts "Loaded #{@students.count} from #{@filename}"
end 

# #################################################

def student_array(name, cohort, hobby, date_of_birth)
   @students << {name: name , cohort: cohort.to_sym, hobby: hobby, date_of_birth: date_of_birth}
   @students
end

def try_load_students
  if !ARGV.first.nil? 
  @filename = ARGV.first
  check_file_exist_and_load
  else
    load_students
    load_confirmation_message
  end
end

def load_students
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, date_of_birth = line.chomp.split(",")
    student_array(name, cohort, hobby, date_of_birth)
  end
  file.close
end

def save_students
   file = File.open(@filename, "w")
   @students.each do |student|
     student_data = [student[:name], student[:cohort], student[:hobby], student[:date_of_birth]]
     csv_line = student_data.join(",")
     file.puts csv_line
   end
   file.close
 end

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.cvs"
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
    when "3"
      save_students
      puts "The file has been successfully saved"
    when "4"
      load_students
      puts "The file has been successfully loaded"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
  loop do
    print_menu 
    selection = STDIN.gets.chomp
    process(selection)
  end
end

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
  name = STDIN.gets.chomp
  # while the name is not empty, repeate this code
  while !name.empty? do
    puts "Enter the hobby"
    hobby = STDIN.gets.chomp
    puts "Enter the date of birth"
    date_of_birth = STDIN.gets.chomp
    puts "Enter the cohort"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = :unknown
    end
    while !COHORTS.include?(cohort)
      puts "You made a typo, please type again"
      cohort = STDIN.gets.chomp
    end
    # add the student hash to the array
    student_array(name, cohort, hobby, date_of_birth)
    students_count
    # get another name from the user
    name = STDIN.gets.chomp
  end
end 

# nothing happens untill we call the methods
try_load_students
interactive_menu