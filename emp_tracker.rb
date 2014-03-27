require 'activerecord'
require './lib/emp'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Employee Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'exit'
    puts "You have a few options:"
    puts "\tType 'add' to add an employee to the database."
    puts "\tType 'list' to list all of the employees in the database."
    puts "\tType 'update' to bring up the menu for updating employee information."
    puts "\tType 'exit' to exit the program."
    choice = gets.chomp
    case choice
    when 'add'
      add
    when 'list'
      list
    when 'edit'
      edit
    when 'exit'
      puts "Thank for for using Employee Tracker! Now exiting the program."
    else
      puts "That is not a valid option. Please try another."
    end
  end
end

def add
  puts "Fill Out Employee Information"
  puts "\tEmployee name:"
  emp_name = gets.chomp
  puts "\tDivision:"
  div_name = gets.chomp
  puts "\tCurrent Project Assignment:"
  proj_name = gets.chomp
  emp = Emp.new({:name => emp_name, :division => div_name})
  emp.save
  puts "'#{emp_name}' has been added to your Employee Tracker database:"
  puts "Name: #{emp_name}\nDivision: #{div_name}"
end

def list
  puts "All employees in database: "
  emp = Emp.all
  emp.each { |emps| puts emp.name }
end

def update
  puts "Which employee would you like to update?\nType 'list' to list all employees."
  choose_emp = gets.chomp
  case choose_emp
  when 'list'
    list
  else
    the_emp = Emp.where({:name => choose_emp}).first
    puts "Please type in the updated name for the Employee:"
    updated_emp = gets.chomp
    puts "Now changing #{the_emp} to #{updated_emp}"
    the_emp.update({:name => updated_emp})
    puts "Employee updated."
  end



welcome
