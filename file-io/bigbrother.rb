# a => apend the file. + =>create the file if it isn't exist
db = File.new('database.txt', 'a+')

print 'would you like to add someone to the database? (y/n)'
response = gets.chomp.downcase

while response == "y"
    print "Enter name, age, gender: "
    person = gets.chomp
    puts "You said: #{person}"

    db.puts person

    print 'would you like to add someone to the database? (y/n)'
    response = gets.chomp.downcase
end


db.close