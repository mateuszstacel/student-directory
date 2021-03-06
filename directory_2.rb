require 'csv'
@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
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
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
 counter = 1

 CSV.foreach("students.csv") do |student|
   puts "#{counter}. #{student[0]}, #{student[1]}"
   counter += 1
 end
   # @students.each do |student|
   #   puts "#{student[:name]}, #{student[:origin]}, #{student[:height]}, (#{student[:cohort]})".center(50)
   # end
end
 


def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
    puts "witxh file you would like to save to?"
  file = File.open(gets.chomp, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts  csv_line
  end
  puts "Students added."
end

def load_students(filename = gets.chomp)
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  puts "Students Loaded."
end
	
def load_existing_students
  filename = ARGV.first
  
  if filename.nil?
  puts "please put yours filename : "
  load_students
  puts "Loaded #{@students.count} from #{filename}"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end	



load_existing_students
interactive_menu