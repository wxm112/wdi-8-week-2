class School
    attr_accessor :name
    attr_reader :db
    def initialize(name)
        @name = name
        @db = {}
    end


    def add(name, grade)
        @db[grade] ||= []
        @db[grade] << name   
    end

    def grade(grade)
        @db[grade]
    end

end

require 'pry'
p school = School.new("Haleakala Hippy School")
p school.db
p school.add("James", 2)
p school.add("Phil", 2)
p school.add("Jennifer", 3)
p school.add("Little Billy", 1)
school.db
school.grade(2)
binding.pry


