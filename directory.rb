poss_cohorts = ["september", "october", "november", "december"]

def input_students(poss_cohorts)
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    cohort = "initial value highly unlikely anyone will type this in"
    while !poss_cohorts.include?(cohort)
      if cohort != "initial value highly unlikely anyone will type this in"
        puts "Sorry, don't recognise that as a cohort. Possible values are: " + poss_cohorts.join(", ")
      end
      puts "Which cohort is #{name} heading for?"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} student" + (students.count > 1 ? "s" : "")
    name = gets.chomp
  end
  #return the array of students
  students
end


#Get the user to enter the names of the students
students = input_students poss_cohorts
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

print_header
print(students, poss_cohorts)
print_footer(students)
