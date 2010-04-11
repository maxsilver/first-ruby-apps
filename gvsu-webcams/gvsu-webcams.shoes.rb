Shoes.app :title => "GVSU Webcams", :width => 900, :height => 547, :resizable => false do
	background white
	background "headerBkg.jpg", :height => 67

	@header = rect 0,0,200,67
	@header.style(:fill => "gvsu-logo.gif", :strokewidth => 0)	
	
	flow :left => 0, :top => 67, :height => 480, :width => 260, :scroll => true do
		stack :height => 120, :width => 260 do
			background white
			image "http://148.61.171.201//axis-cgi/jpg/image.cgi?resolution=160x120"
		end
		stack :height => 80, :width => 260 do
			background blue
			@msg = title "blerg"
		end		
		stack :height => 40, :width => 260 do
			background red
		end
												
	end
	
	stack :left => 260, :top => 67, :width => 640, :height => 480 do
		background black
		@imgpath =  "http://148.61.165.230//axis-cgi/jpg/image.cgi?resolution=640x480"
		@viewer = image @imgpath
	end


	every 5 do
    	@viewer.path = (@imgpath + "&time=" +  Time.now.strftime("%I%M%S%m%d%Y"))
     	@msg.replace(Time.now.strftime("%I%M%S%m%d%Y"))	    	
   	end
end