# a => apend the file. + =>create the file if it isn't exist
db = File.new('database.txt', 'a+')

print 'would you like to add someone to the database? (y/n)'
response = gets.chomp.downcase

while response == "y"
    print "Enter name, age, gender: "
    db.puts gets.chomp

    print 'would you like to add someone to the database? (y/n)'
    response = gets.chomp.downcase
end


db.close
## End of database and section
class Person
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
        @name, @age, @gender = name, age, gender
    end    

    def to_s
        "#{name} is #{age} years old and #{gender}"
    end
end
## Begainnning of database read section

db = File.open('database.txt','r')
people = []

db.each do |line|
    info = line.chomp.split /[, ]+/ #Regular expression.
    person = Person.new info[0].strip, info[1].strip, info[2].strip #Splat this *info.
    people << person
end

db.close

people.each do |p|
    puts p.to_s
end

