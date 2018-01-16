# John Brock
# Project Euler Problem 27
# https://projecteuler.net/problem=27
# 2018-01-16

# sieve of eratosthenes
def sieve_of_eratosthenes(max)
  list = Array.new(max + 1, true)
  list[0] = false
  list[1] = false
  list.each_with_index do |bool, index|
    if bool
      i = 2
      while index * i <= max
        list[index * i] = false
        i += 1
      end
    end
  end
  list
end

# is this number prime
# int, (list) -> boolean
# uses a global variable
# I'm a bad bad boy
def prime?(n)
  if $sieve
    if $sieve.length > n
      return $sieve[n]
    end
  end
  $sieve = sieve_of_eratosthenes(n)
  $sieve[n]
end

def consecutive_primes(a, b)
  n = 0
  n += 1 while prime?(n**2 + (a * n) + b)
  n
end

# returns the product of the coefficients, a and b,
# for the quadratic expression that produces
# the maximum number of primes for consecutive values of n, starting with n = 0
# 
# n**2 + an + b, where |a| < 1000 and |b| <= 1000
def quadratic_primes(a_limit, b_limit)
  most_consecutive_primes = 0
  most_consecutive_primes_values = [0, 0]

  # start at smallest a possible a and b value and increment up to limit
  a = -1 * a_limit
  # first value of n is 0 so b has to be a prime number
  # b starts with the lowest prime number
  b_start = 2
  while a < a_limit
    b = b_start
    while b < b_limit
      prime_count = consecutive_primes(a, b)
      if prime_count > most_consecutive_primes
        most_consecutive_primes = prime_count
        most_consecutive_primes_values = [a, b]
      end
      b += 1
    end
    a += 1
  end
  most_consecutive_primes_values[0] * most_consecutive_primes_values[1]
end

start = Time.now()
$sieve = sieve_of_eratosthenes(13000)
puts quadratic_primes(1000, 1000)
finish = Time.now()
puts finish - start