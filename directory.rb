def input_students
  puts "Please enter the names, hobby, height, country of birth of the students"
  puts "To finish, just hit return twice"
# create an empty array
  students = []
# get the information
  puts "Student name : ".center(20)
    name = gets.chomp.capitalize.to_str
  puts "which cohort you are? ".center(26)
    cohort = gets.chomp.to_str
  puts "Hobbys separeted by comma : ".center(13)
    hobby = gets.chomp.to_str
  puts "Height : ".center(13)
    height = gets.chomp.to_str
  puts "Country of birth : ".center(24)
    country_of_birth = gets.chomp.to_str
# while the name is not empty, repeat this code
  while !name.empty? do
# add the student hash to the array
    students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym, height: height.to_sym, country_of_birth: country_of_birth.to_sym}
# making shure user don't make any typo ,also he can redo inputs
    user_typo(students)
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
# get another name from the user
    puts "Student name : ".center(20)
    name = gets.chomp.capitalize.to_str
#break loop if user enter ""
    if name == ""
      break
    else
      puts "which cohort you are? ".center(26)
      cohort = gets.chomp.to_str
      puts "Hobbys separeted by comma : ".center(13)
      hobby = gets.chomp.to_str
      puts "Height : ".center(13)
      height = gets.chomp.to_str
      puts "Country of birth : ".center(24)
      country_of_birth = gets.chomp.to_str
    end
    
  end
# return the array of students
  students
end

def user_typo(students)
  puts "Please confirm that detail are correct put 'yes' or 'edit'"
  input = gets.chomp
  case input
    when "yes"
      puts "Details saved."
    when "edit"
      students.pop
      puts "Please redo form again."
  end
  
end



def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "Student : #{student[:name]}, hobby is : #{student[:hobby]}, height : #{student[:height]} country of birth #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
  end
end
	
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# printing names started on ... "letter"
def print_specific_names(students)
  counter = 1
  puts "please type in specific letter"
  letter = gets.chomp.capitalize
  students.each do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]}, hobby is : #{student[:hobby]}, height : #{student[:height]} country of birth #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
      counter += 1
    end
  end
end

#printing names shorter then user length input
def print_names_by_length(students)
  counter = 1
  puts "Please put the length of the name"
  length = gets.chomp.to_i
  students.each do |student|
    if student[:name].length < length
      puts "#{student[:name]}, hobby is : #{student[:hobby]}, height : #{student[:height]} country of birth #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
      counter += 1
    end
  end
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_specific_names(students)
print_names_by_length(students)