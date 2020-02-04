# input students
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash into the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name of the student
    name = gets.chomp
  end
  students
end

# interactive menu
def interactive_menu
  loop do
  # 1. print the menu and ask user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it to variable
  selection = gets.chomp
  # 3. do what the user has asked
  end
end

# print header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# print the list of the students
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print total number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end


students = input_students

print_header
print(students) # passing students array of hashes as the method argument so students array = students method argument
print_footer(students) # passing students array of hashes as the method argument so students array = names method argument