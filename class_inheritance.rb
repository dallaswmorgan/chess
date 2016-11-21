class Employee
  attr_accessor :boss, :salary, :title
  attr_reader :name

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
    bonus
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss=nil, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_employee_salary = 0
    queue = [self]
    until queue.empty?
      first_manager = queue.shift
      first_manager.employees.each do |employee|
        queue << employee if employee.is_a?(Manager)
        total_employee_salary += employee.salary
      end
    end
    total_employee_salary * multiplier
  end
end
