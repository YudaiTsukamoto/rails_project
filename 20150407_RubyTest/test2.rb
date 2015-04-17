Dir.glob( "./*" ) do | f |

	if  !File.directory?( f ) &&
		/\d/ =~ File.basename( f, ".*" ) &&
		/^\.(txt|html|css|md)$/ =~ File.extname( f )
		
		puts File.basename( f )	 

	end
end
