@students = []
@poss_cohorts = ["september", "october", "november", "december"]

def print_menu
  puts "1. Input students"
  puts "2. Show student data"
  puts "3. Save student data to students.csv"
  puts "4. Load student data from students.csv"
  puts "9. Exit"
end

#Print the students' names
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.sort_by{|student| @poss_cohorts.index(student[:cohort].to_s)}.each do |student|
    puts "#{student[:name]}".center(30) + "#{student[:cohort]} cohort".center(18) #+ "#{student[:height]} tall and enjoys #{student[:hobbies]}".center(35)
  end
end

def print_footer
  puts "Overall we have #{@students.count} great student" + (@students.count > 1 ? "s" : "")
end

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
    if @students.length > 0
      show_students
    else
      puts "No student data to show"
    end
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Sorry, please enter a valid option from the list"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  while !name.empty? do
    #add the student hash to the array
    cohort = "initial value highly unlikely anyone will type this in"
    while !@poss_cohorts.include?(cohort)
      if cohort != "initial value highly unlikely anyone will type this in"
        puts "Sorry, don't recognise that as a cohort. Possible values are: " + @poss_cohorts.join(", ")
      end
      puts "Which cohort is #{name} heading for?"
      cohort = STDIN.gets.chomp
    end
    add_student(name, cohort)
    puts "Now we have #{@students.count} student" + (@students.count > 1 ? "s" : "")
    name = STDIN.gets.chomp
  end
end

# load data from disc if filename supplied on command line
try_load_students
# open interactive menu and find out what user wants to do
interactive_menu
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: poss_cohorts.sample.to_sym, hobbies: "football", height: "182cm"},
#   {name: "Darth Vader", cohort: poss_cohorts.sample.to_sym, hobbies: "homebrewing", height: "187cm"},
#   {name: "Nurse Ratched", cohort: poss_cohorts.sample.to_sym, hobbies: "football", height: "168cm"},
#   {name: "Michael Corleone", cohort: poss_cohorts.sample.to_sym, hobbies: "fishing", height: "166cm"},
#   {name: "Alex DeLarge", cohort: poss_cohorts.sample.to_sym, hobbies: "football", height: "160cm"},
#   {name: "The Wicked Witch of the West", cohort: poss_cohorts.sample.to_sym, hobbies: "fishing", height: "174cm"},
#   {name: "Terminator", cohort: poss_cohorts.sample.to_sym, hobbies: "football", height: "189cm"},
#   {name: "Freddy Krueger", cohort: poss_cohorts.sample.to_sym, hobbies: "homebrewing", height: "175cm"},
#   {name: "The Joker", cohort: poss_cohorts.sample.to_sym, hobbies: "coding", height: "171cm"},
#   {name: "Joffrey Baratheon", cohort: poss_cohorts.sample.to_sym, hobbies: "coding", height: "165cm"},
#   {name: "Norman Bates", cohort: poss_cohorts.sample.to_sym, hobbies: "music", height: "182cm"}
# ]
