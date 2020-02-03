# add students into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratchet",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]


# print header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# print the list of the students
def print(names)
  names.each do |name|
    puts name
  end
end

# print total number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

print_header
print(students) # passing students array as the argument so students = names in the method
print_footer(students) # passing students array as the argument so students = names in the method