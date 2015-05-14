def prime_number_proc
  primes = []
  proc do
    if primes.any?
      number = primes.last + 1
    else
      number = 2
    end
    loop do
      if prime?(number)
        primes << number
        break
      end
      number += 1
    end
    primes
  end
end

def prime?(number)
  return true if number == 2
  return false if number < 2 || number.even?

  3.step(Math.sqrt(number), 2) do |divisor|
    if number % divisor == 0
      return false
    end
  end
  true
end

fun = prime_number_proc

10.times do
  p fun.call
end
