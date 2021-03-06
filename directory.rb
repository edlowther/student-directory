require 'csv'

@students = []
@poss_cohorts = ["september", "october", "november", "december"]

def print_menu
  puts "1. Input students"
  puts "2. Show student data"
  puts "3. Save student data"
  puts "4. Load student data"
  puts "9. Exit"
end

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

def load_or_save_file(load_or_save)
  if load_or_save == "load"
    puts "Loading student data from students.csv - okay? (y/n)"
  elsif load_or_save == "save"
    puts "Saving student data to students.csv - okay? (y/n)"
  else
    puts "Catastrophic coding error. My apologies."
    return
  end
  answer = STDIN.gets.chomp
  case answer
  when "y"
    if load_or_save == "load"
      load_students
    elsif load_or_save == "save"
      save_students
    end
  when "n"
    puts "Okay, which filename do you want to use then?"
    filename = STDIN.gets.chomp
    if load_or_save == "load"
      if File.exists?(filename)
        load_students(filename)
      else
        puts "Sorry - don't seem to have that file"
      end
    elsif load_or_save == "save"
      save_students(filename)
    end
  else
    puts "Sorry - was expecting either a 'y' or an 'n'"
  end
end

def process(selection)
  case selection
  when "1"
    puts "Okay, let's have some student data!"
    input_students
  when "2"
    if @students.length > 0
      puts "Showing student data"
      show_students
    else
      puts "No student data to show"
    end
  when "3"
    load_or_save_file("save")
  when "4"
    load_or_save_file("load")
  when "9"
    puts "Exiting program. Bye!"
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

def save_students(filename = "students.csv")
  CSV.open(filename, 'w') do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
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
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student(name, cohort)
  end
end

def get_cohort name
  cohort = "initial value highly unlikely anyone will type this in"
  while !@poss_cohorts.include?(cohort)
    if cohort != "initial value highly unlikely anyone will type this in"
      puts "Sorry, don't recognise that as a cohort. Possible values are: " + @poss_cohorts.join(", ")
    end
    puts "Which cohort is #{name} heading for?"
    cohort = STDIN.gets.chomp
  end
  cohort
end

def enter_data
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = get_cohort name
    add_student(name, cohort)
    puts "Now we have #{@students.count} student" + (@students.count > 1 ? "s" : "")
    name = STDIN.gets.chomp
  end
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  enter_data
end

# load data from disc if filename supplied on command line
try_load_students
# open interactive menu and find out what user wants to do
interactive_menu
