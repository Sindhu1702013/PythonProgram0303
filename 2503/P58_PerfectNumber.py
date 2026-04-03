# Author: OMKAR PATHAK

# Wikipedia : In number theory, a perfect number is a positive integer that is equal to the sum of
# its proper positive divisors, that is, the sum of its positive divisors excluding the number itself
# (also known as its aliquot sum). Equivalently, a perfect number is a number that is half the sum of all
# of its positive divisors (including itself).
# Example : The first perfect number is 6, because 1, 2, and 3 are its proper positive divisors,
# and 1 + 2 + 3 = 6. Equivalently, the number 6 is equal to half the sum of all its positive divisors:
# ( 1 + 2 + 3 + 6 ) / 2 = 6. The next perfect number is 28 = 1 + 2 + 4 + 7 + 14. This is followed by the
# perfect numbers 496 and 8128.

def perfect_number(number):
    sum = 0
    for divisor in range(1, number):
        if number % divisor == 0:
            sum += divisor
    return sum == number

if __name__ == '__main__':
    print(perfect_number(6)) # True
    print(perfect_number(3)) # False
