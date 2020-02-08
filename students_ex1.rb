# input students
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Name"
  name = gets.chomp
   # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash into the array
    puts "Cohort"
    cohort = gets.chomp.to_sym
    cohort = "february".to_sym if cohort.empty?
    p students << {name: name, cohort: cohort}
      if students.length == 1 
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
    # get another name of the student
    puts "Name"
    name = gets.chomp
  end
  # return the array of students
  students
end

# print header
def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------------------------".center(50)
end

# print the list of the students
def print(students)
  students.each.with_index do |student, index|
    puts "#{(index + 1)}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

# print total number of students
def print_footer(names)
  if names.count == 1 
    puts "Overall we have #{names.count} great student".center(50)
  else
    puts "Overall we have #{names.count} great students".center(50)
  end
end


students = input_students

print_header
print(students) # passing students array of hashes as the method argument so students array = students method argument
print_footer(students) # passing students array of hashes as the method argument so students array = names method argument