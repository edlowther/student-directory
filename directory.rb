#Print the students' names
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, poss_cohorts)
  students.sort_by{|student| poss_cohorts.index(student[:cohort].to_s)}.each do |student|
    puts "#{student[:name]}".center(30) + "#{student[:cohort]} cohort".center(18) #+ "#{student[:height]} tall and enjoys #{student[:hobbies]}".center(35)
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great student" + (names.count > 1 ? "s" : "")
end

def interactive_menu(poss_cohorts)
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input students"
    puts "2. Show student data"
    puts "9. Exit"
    # 2. read the input and save to a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students poss_cohorts
    when "2"
      # if students.length > 0
        print_header
        print(students, poss_cohorts)
        print_footer(students)
      # else
      #   puts "No student data to show"
      # end
    when "9"
      exit
    else
      puts "Sorry, please enter a valid option from the list"
    end
  end
end

poss_cohorts = ["september", "october", "november", "december"]

def input_students(poss_cohorts)
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.gsub("\n", "")
  while !name.empty? do
    #add the student hash to the array
    cohort = "initial value highly unlikely anyone will type this in"
    while !poss_cohorts.include?(cohort)
      if cohort != "initial value highly unlikely anyone will type this in"
        puts "Sorry, don't recognise that as a cohort. Possible values are: " + poss_cohorts.join(", ")
      end
      puts "Which cohort is #{name} heading for?"
      cohort = gets.gsub("\n", "")
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} student" + (students.count > 1 ? "s" : "")
    name = gets.gsub("\n", "")
  end
  #return the array of students
  students
end

# open interactive menu and find out what user wants to do
interactive_menu poss_cohorts
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
