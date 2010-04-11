#set up default image
imgpath =  "http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=640x480"

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


	Webcam.new('Cook Clock Tower - South',
			   'http://148.61.37.229/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.37.229/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Cook Clock Tower - North',
			   'http://148.61.142.228/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.142.228/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Campus Drive',
			   'http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.165.230/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Great Lakes Plaza',
			   'http://148.61.97.229/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.97.229/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Mackinac Hall',
			   'http://148.61.229.201/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.229.201/axis-cgi/jpg/image.cgi?resolution=640x480'),
	Webcam.new('Laker Turf Building',
			   'http://148.61.63.218/axis-cgi/jpg/image.cgi?resolution=320x240',
			   'http://148.61.63.218/axis-cgi/jpg/image.cgi?resolution=640x480'),			   
	
]

	background white
	background "headerBkg.jpg", :height => 67

	@header = rect 0,0,200,67
	@header.style(:fill => "gvsu-logo.gif", :strokewidth => 0)	
	

	
	stack :left => 260, :top => 67, :width => 640, :height => 480 do
		background black
		@viewer = image imgpath, :width => 640, :height => 480
	end
	
	stack :left => 260, :top => 547, :width => 640, :height => 480 do
		@viewer2 = image imgpath, :width => 640, :height => 480
	end	

	@timer = every 1 do
		@viewer.path = @viewer2.path
    	@viewer2.path = (imgpath + "&time=" +  Time.now.strftime("%I%M%S%m%d%Y"))   	
   	end
	
	flow :left => 0, :top => 67, :height => 480, :width => 260, :scroll => true do
	
		@webcams.each{ |webcam|
			stack :height => 60, :width => 260 do
				webcam.thumb += "&time=" +  Time.now.strftime("%I%M%S%m%d%Y")
				image webcam.thumb, :width => 80, :height => 60
				para webcam.name, :top => 0, :left => 80
				button "View", :top => 30, :left => 100 do
					if imgpath == webcam.feed
						alert 'You are already watching this camera!'
					else
						imgpath = webcam.feed
						@viewer.path = webcam.thumb
						@viewer2.path = imgpath + "&time=" +  Time.now.strftime("%I%M%S%m%d%Y")
					end
				end
				
			end
		}


												
	end
	

end
