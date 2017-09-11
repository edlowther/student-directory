def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  #return the array of students
  students
end


#Get the user to enter the names of the students
# students = input_students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "football", height: "182cm"},
  {name: "Darth Vader", cohort: :november, hobbies: "homebrewing", height: "187cm"},
  {name: "Nurse Ratched", cohort: :november, hobbies: "football", height: "168cm"},
  {name: "Michael Corleone", cohort: :november, hobbies: "fishing", height: "166cm"},
  {name: "Alex DeLarge", cohort: :november, hobbies: "football", height: "160cm"},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "fishing", height: "174cm"},
  {name: "Terminator", cohort: :november, hobbies: "football", height: "189cm"},
  {name: "Freddy Krueger", cohort: :november, hobbies: "homebrewing", height: "175cm"},
  {name: "The Joker", cohort: :november, hobbies: "coding", height: "171cm"},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "coding", height: "165cm"},
  {name: "Norman Bates", cohort: :november, hobbies: "music", height: "182cm"}
]

#Print the students' names
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}".center(30) + "#{student[:cohort]} cohort".center(18) + "#{student[:height]} tall and enjoys #{student[:hobbies]}".center(35)
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
