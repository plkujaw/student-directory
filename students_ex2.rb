@students = [] # an empty array accessible to all methods

# input students
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash into the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name of the student
    name = STDIN.gets.chomp
  end
end

# def create_students_list
#  @students << {name: name, cohort: :november}
#  @students << {name: name, cohort: cohort.to_sym} 
# end

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
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
        puts "You have chosen to input the students:"
        puts ""
        input_students
      when "2"
        puts "You have chosen to show the list of the students:"
        puts ""
        show_students
      when "3"
        puts "You have saved the list of the students"
        puts ""
        save_students
      when "4"
        puts "Loaded list of #{@students.count} students"
        puts ""
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
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# load the students list from the file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym} 
    end
    # puts "Loaded list of #{@students.count} students from #{filename}"
  file.close
end

def try_load_students
  # filename = ARGV.first # first argument from the command line
  filename = "students.csv" # load students.csv by default
  return if filename.nil? # get out of the method if argument isn't given
  if File.exist?(filename) # if argument is given check if file exists
    load_students(filename)
    puts "Loaded list of #{@students.count} students from #{filename}"
  else # if given file doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit #quit the program
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

try_load_students
interactive_menu
