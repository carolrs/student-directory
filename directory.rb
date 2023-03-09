def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  while true do
    puts "Enter a name"
    name = gets.chomp

    if name.empty?
      break
    end
    puts "Enter the cohort"
    cohort = gets.chomp
    puts "Enter the age"
    age = gets.chomp
    puts "Hobbies:"
    hobbie = gets.chomp

    if cohort.empty?
      @students << create_student_hash(name,age,hobbie)
    else   
      @students << create_student_hash(name,age,hobbie,cohort)
    end
    puts "Now we have #{@students.count} student#{@students.count != 1 ? 's' : ''}"
  end
  
end

def create_student_hash(name,age,hobbie,cohort = 'undefined cohort')
    {name: name, cohort: cohort.to_s, age: age, hobbie: hobbie}
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print_students
  list_to_print = @students
  .select { |student_hash|
    student_hash[:name].upcase.start_with?("A")
  }
  .select { |student_hash|
    student_hash[:name].length < 12
  }

  if !list_to_print.empty?
    list_to_print.each_with_index { |student_hash, i|
      puts ("#{i + 1}. #{student_hash[:name]} (#{student_hash[:cohort]} cohort), " +
      "age: #{student_hash[:age]}, hobbie: #{student_hash[:hobbie]}").center(80,' ')
    }
  end
  # students.each_with_index do |student_hash, i|
  #   if student_hash[:name].upcase.start_with?("A") && student_hash[:name].length < 12
  #     puts ("#{i + 1}. #{student_hash[:name]} (#{student_hash[:cohort]} cohort), " +
  #     "age: #{student_hash[:age]}, hobbie: #{student_hash[:hobbie]}").center(80,' ')
  #   end
  # end
end

def group_by_cohort
  @students.group_by{|student| student[:cohort].itself }
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students()
  print_footer()
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_footer(students)
#printing the total number of students
  puts "Overall, we have #{students.count} great students"
end

def print_footer
#printing the total number of students
  puts "Overall, we have #{@students .count} great students"
end
@students = []
#input_students
#print_header
interactive_menu
#print_students
#students_by_cohort = group_by_cohort
#print_footer