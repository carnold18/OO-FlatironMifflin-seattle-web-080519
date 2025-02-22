require 'pry'

class Manager

    attr_reader :name, :department, :age

    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self   
    end

    def employees
        Employee.all.select { |employee| employee.manager == self}
    end

    def hire_employee(name, salary)
        Employee.new(name, salary, self)
    end

    def self.all_departments
        self.all.map { |manager| manager.department }
    end

    def self.average_age
        sum = 0
        num_of_managers = self.all.length.to_f
        self.all.each { |manager| sum += manager.age.to_f }
        average = sum / num_of_managers
        average
        # binding.pry
    end

    def self.all
        @@all
    end

end
