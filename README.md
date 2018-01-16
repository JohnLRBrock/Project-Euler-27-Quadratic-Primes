Solution for Project Euler problem 27 - Quadratic Primes

The solution starts with an implementation of the sieve of Eratosthenes.

Then I constructed a #prime? method for testing the prime nature of its input using the sieve.

Next I created a method that tests for the number of consecutive primes starting at 0.

Finally I constructed a method that does a brute force search for the quadratic formula with the most consecutive primes between the given limit.

On my machine the computation takes about .51 seconds and could be made faster by up to 20% by reducing the number of unnecessary calls to #sieve_of_eratosthenes.
