require_relative 'employee'
require 'byebug'

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus(multiplier)
    total_salary * multiplier
  end

  protected

  def total_salary
    total_salary = 0
    employees.each do |employee|
      if employee.is_a? Manager
        total_salary += employee.salary + employee.total_salary
      else
        total_salary += employee.salary
      end
    end
    total_salary
  end

end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
p ned.employees
puts " "
p darren.employees
# shawna = Employee.new("Shawna", "TA", 12000, darren)
# [shawna, david, darren, ned].each do |person|
#   if person.boss
#     debugger
#     if person.respond_to?(employees)
#       person.boss.employees << person
#       person.boss.employees += person.employees
#     else
#       person.boss.employees << person
#     end
#   end
# end
#
# ned.employees << darren
# ned.employees << shawna
# ned.employees << david
#
# darren.employees << shawna
# darren.employees << david
#
# p ned.bonus(5)
# p darren.bonus(4)
# p david.bonus(3)
