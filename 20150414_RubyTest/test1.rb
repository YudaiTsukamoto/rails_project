def prime_number_proc
    primes = []

    f = Proc.new do
        prime = primes[-1].to_i
        loop do
            prime += 1
            if prime?(prime)
                primes << prime 
                break
            end
        end
        primes
    end	  
    f
end

def prime?(prime)
    return true if prime == 2
    return false if prime < 2 || prime % 2 == 0

    3.step(Math.sqrt(prime), 2) do |divisor|
        if prime % divisor == 0
            return false
        end
    end
    true
end

fun = prime_number_proc
10.times do 
   p fun.call
end
