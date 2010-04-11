Shoes.app :title => "GVSU Webcam Viewer", :width => 900, :height => 547 do
	background white
	background "headerBkg.jpg", :height => 67


	@header = rect 0,0,200,67
	@header.style(:fill => "gvsu-logo.gif", :strokewidth => 0)	
	
	stack :left => 0, :top => 67, :height => 480, :width => 260 do
		background blue
		 title strong("blerg"), :align => "left", :stroke => "#DFA", :margin => 0
	end
	
	stack :left => 260, :top => 67, :width => 640, :height => 480 do
		background black
		@viewer = image "http://148.61.171.201//axis-cgi/jpg/image.cgi?resolution=640x480"
	end

	
	
end