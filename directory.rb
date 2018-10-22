def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = 1
  students.each do |student|
    puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)"
    counter += 1
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
      puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)"
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
      puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)"
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