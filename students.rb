# add students into an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratchet", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]


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

print_header
print(students) # passing students array as the argument so students array = students argument in the method
print_footer(students) # passing students array as the argument so students array = names argument in the method