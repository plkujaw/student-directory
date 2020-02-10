require 'csv'
@students = [] # an empty array accessible to all methods

# input students
def input_students
  puts "Please enter the names and cohort of the students"
  puts "To finish just hit return twice"
  puts ""
  puts "Name:"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort:"
    cohort = STDIN.gets.chomp.to_sym
    if cohort.empty?
      cohort = "february".to_sym
      puts cohort
    end
    # add the student hash into the array
    @students << {name: name, cohort: cohort}
    if @students.length == 1 
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name of the student
    name = STDIN.gets.chomp
  end
end

# interactive menu
def interactive_menu
  loop do
    # 1. show the menu and ask user what to do
    print_menu
    # 2. read and process the input
    process(STDIN.gets.chomp)
  end
end

# show menu
def print_menu
  puts ""
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
  puts ""
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
        puts "You have chosen to add new students"
        puts ""
        input_students
      when "2"
        puts "You have chosen to show the list of the students"
        puts ""
        show_students
      when "3"
        puts "Save the list as:"
        save_students
      when "4"
        puts "Load the list from:"
        load_students
      when "9"
        puts "Good bye!"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
end

# save the students list into the file
def save_students
  # ask for a filename to save to
  
  save_to_filename = STDIN.gets.chomp
  # open file for writing
  
  CSV.open(save_to_filename, "w") do |line|
    @students.each do |student|
      line << [student[:name], student[:cohort]]
    end
  end
  puts "You have saved the list of the students in the #{save_to_filename} file"
end

# load the students list from the file
def load_students(load_from_filename = STDIN.gets.chomp)
  if File.exist?(load_from_filename)
    CSV.read(load_from_filename).each do |line|
        name, cohort = line
        @students << {name: name, cohort: cohort.to_sym}
      end
    puts "Loaded list of #{@students.count} students from #{load_from_filename}"
  else # if given file doesn't exist
    puts "Sorry, #{load_from_filename} doesn't exist"
    exit # quit the program
  end
end

def try_load_students
  load_from_filename = ARGV.first # first argument from the command line
  load_from_filename = "students.csv" if load_from_filename.nil? # open students.csv by default if argument isn't given
  if File.exist?(load_from_filename) # if argument is given check if file exists
    load_students(load_from_filename)
  else # if given file doesn't exist
    puts "Sorry, #{load_from_filename} doesn't exist"
    exit # quit the program
  end
end

# show header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# show the list of the students
def print_students_list
  @students.each.with_index do |student, index|
    puts "#{(index + 1)}. #{student[:name]} (#{student[:cohort]} cohort)"
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

try_load_students
interactive_menu