@students = [] # an empty array accessible to all methods

# input students
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash into the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name of the student
    name = gets.chomp
  end
end

# interactive menu
def interactive_menu
  loop do
    # 1. show the menu and ask user what to do
    print_menu
    # 2. read and process the input
    process(gets.chomp)
  end
end

# show menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

# print students list
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
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
end
# show header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# show the list of the students
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# show total number of students
def print_footer
  if @students.count == 1 
    puts "Overall we have #{@students.count} great student"
  else
    puts "Overall we have #{@students.count} great students"
  end
end

interactive_menu
