# add students data into an array of hashes
# students = [
# {name: "Dr. Hannibal Lecter", cohort: :november},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratchet", cohort: :november},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex DeLarge", cohort: :november},
# {name: "The Wicked Witch of the West", cohort: :november},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Krueger", cohort: :november},
# {name: "The Joker", cohort: :november},
# {name: "Joffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november}
# ]

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
      if students.length == 1 
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
    # get another name of the student
    name = gets.chomp
  end
  students
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
  if names.count == 1 
    puts "Overall we have #{names.count} great student"
  else
    puts "Overall we have #{names.count} great students"
  end
end


students = input_students

print_header
print(students) # passing students array of hashes as the method argument so students array = students method argument
print_footer(students) # passing students array of hashes as the method argument so students array = names method argument