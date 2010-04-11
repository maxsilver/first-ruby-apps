# Random Ruby Stuff
# from Chapter 1 - Beginning Ruby


#simple conditionals
age = 9000
puts "You're not born?"    if age < 0
puts "You're a baby!"      if age >= 0 && age < 5
puts "You're a child!"     if age >= 5 && age < 13
puts "You're a teenager!"  if age >= 13 && age < 19
puts "You're an adult!"    if age >= 20 && age < 150
puts "You're likely dead!" if age >= 150 && age < 9000
puts "You're a mummy!"     if age >= 9000

# there are lots of useful methods built into default objects ('datatypes')
verse = "We hold these truths to be self-evident, that all men are created equal..."
puts verse, "\n"
puts verse.length, "\n"
puts verse.upcase, "\n"
puts verse.reverse, "\n"
puts verse.swapcase.reverse.sum, "\n"

# turns out, put is a method of a class (a superclass). Ruby's object is called 'Kernel'
Kernel.puts "the method 'puts' is from class type : ", Kernel.class


# some class inheritance
class Pet
	attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
	# a simple method
	def bark
		puts "Woof!"
	end
		
end

class Snake < Pet
	attr_accessor :length #adding a property not already defined in parent 'Pet'
end

snake = Snake.new
snake.name = "Sammy"
snake.length = 500

lassie = Dog.new
lassie.name = "Lassie"
lassie.age = 20

# lassie barks a lot
3.times do
	lassie.bark
end


	





# let's make a class
class Person
	attr_accessor :name,
				  :age,
				  :gender,
				  :hometown
end

# and lets do something with that class.
FunnyMan = Person.new
FunnyMan.name     = "Jon Stewart"
FunnyMan.age      = 47 # as of 4/10/2010
FunnyMan.gender   = "male"
FunnyMan.hometown = "New York, NY"


print "Our next guest is ", FunnyMan.name, 
	   " from beautiful ", FunnyMan.hometown,
	   "\n"

# a simple loop
3.times do print "Hello, World!" + "\n" end

# commas can concatinate print requests, similar to PHP echo("string", "string")
print "Hello. Did you know that 2 + 2 = ", (2 + 2)
