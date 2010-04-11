# Random Ruby Stuff
# from Chapter 1 - Beginning Ruby





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
10.times do
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
10.times do print "Hello, World!" + "\n" end

# commas can concatinate print requests, similar to PHP echo("string", "string")
print "Hello. Did you know that 2 + 2 = ", (2 + 2)
