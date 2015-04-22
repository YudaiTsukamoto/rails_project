def prime_number_proc
    primes = []

    f = Proc.new do
        primes.size == 0 ? number = 2 : number = primes[-1] + 1 
        loop do
            if prime?(number)
                primes << number 
                break
            end
            number += 1
        end
        primes
    end	  
    f
end

def prime?(number)
    return true if number == 2
    return false if number % 2 == 0

    3.step(Math.sqrt(number), 2) do |num|
        if number % num == 0
            return false
        end
    end
    true
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
p fun.call()
