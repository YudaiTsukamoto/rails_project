a = [ 1 , 1 ]
n = '' 
loop do
		puts " フィボナッチ数列の項数を入力して下さい "
		n = gets.chomp.to_i
		puts n
		break unless n<=0
		puts "項数には正の整数を入力して下さい"
end

if n == 1
		a.delete_at( -1 )
else
		( n.to_i - 2 ).times do
				a << a[ -1 ] + a[ -2 ]
		end
end
puts a.inspect
