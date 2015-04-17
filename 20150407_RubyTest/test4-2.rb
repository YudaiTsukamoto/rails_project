files=Dir.glob("./*")
files.each do |f|
		    if /[0-9].[(txt)(html)(css)(md)]/ =~f
					        puts f
							    end
end
