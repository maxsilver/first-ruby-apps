#set up default image
imgpath =  "http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=640x480"
nextimgpath = nil

class Webcam
	attr_accessor :name, :thumb, :feed
	
	def initialize(name, thumb, feed)
		@name = name
		@thumb = thumb
		@feed = feed
	end
end

Shoes.app :title => "GVSU Webcams", :width => 900, :height => 547 do

@webcams = [
	Webcam.new('Campus Drive',
			   'http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Laker Turf Building',
			   'http://148.61.63.218/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.63.218/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Great Lakes Plaza',
			   'http://148.61.97.229/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.97.229/axis-cgi/jpg/image.cgi?resolution=640x480'),			   
	
]

	background white
	background "headerBkg.jpg", :height => 67

	@header = rect 0,0,200,67
	@header.style(:fill => "gvsu-logo.gif", :strokewidth => 0)	
	

	
	stack :left => 260, :top => 67, :width => 640, :height => 480 do
		@viewer = image imgpath, :width => 640, :height => 480
	end
	
	stack :left => 260, :top => 547, :width => 640, :height => 480 do
		@viewer2 = image imgpath, :width => 640, :height => 480
	end	

	@timer = every 1 do
		if nextimgpath != nil
			imgpath = nextimgpath
			nextimgpath = nil
		end
		@viewer.path = @viewer2.path
    	@viewer2.path = (imgpath + "&time=" +  Time.now.strftime("%I%M%S%m%d%Y"))
     	#@msg.replace(Time.now.strftime("%I%M%S%m%d%Y"))	    	
   	
   	end
	
	flow :left => 0, :top => 67, :height => 480, :width => 260, :scroll => true do
	
		@webcams.each{ |webcam|
			stack :height => 60, :width => 260 do
				image webcam.thumb, :width => 80, :height => 60
				para webcam.name, :top => 0, :left => 80
				button "View", :top => 30, :left => 100 do
					if imgpath == webcam.feed
						alert 'You are already watching this camera!'
					else
						nextimgpath = webcam.feed
						@viewer.path = webcam.thumb
						@viewer2.path = webcam.feed
					end
				end
				
			end
		}


												
	end
	

end