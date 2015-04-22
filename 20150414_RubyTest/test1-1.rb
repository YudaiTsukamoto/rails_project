require 'prime'
def prime_proc
	primes = []
	f = Proc.new do
		if primes.size == 0
			num = 2
		else
			num = primes[-1].to_i + 1
		end

		loop do
			if num.prime?
				primes << num
				break
			end
			num += 1
		end
		primes
	end
end

fun = prime_proc

p fun.call
p fun.call
p fun.call
p fun.call
p fun.call
p fun.call
