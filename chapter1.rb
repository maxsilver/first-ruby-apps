# Random Ruby Stuff
# from Chapter 1 - Beginning Ruby



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
