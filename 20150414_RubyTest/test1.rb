def prime_number_proc
	prime = 2 
	primes = []
	f = Proc.new do
		loop do
			is_prime = true
			(2..prime).each do |n|
				if prime % n == 0 && prime != n
					is_prime = false
					break
				end
			end
			if is_prime
				primes << prime
				prime += 1
				break
			end
			prime += 1
		end	  
		primes
	end
	f
end

fun = prime_number_proc
p fun.call()
p fun.call()
p fun.call()
p fun.call()
p fun.call()
p fun.call()
p fun.call()
p fun.call()
p fun.call()
