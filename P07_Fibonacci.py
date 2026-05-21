

# Author: OMKAR PATHAK
# This program generates and displays the Fibonacci sequence using an iterative approach
# The Fibonacci sequence is a series where each number is the sum of the two preceding ones
# Example: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

def fibonacci(n):
    '''
    This function generates the Fibonacci sequence up to n terms using an iterative approach.
    It stores intermediate values in a list to avoid redundant recalculation.
    
    Args:
        n: The number of terms in the Fibonacci sequence (must be between 1 and 10,000)
    
    Returns:
        A list containing the Fibonacci sequence
    '''
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    
    # Initialize the sequence with the first two terms
    fib_sequence = [0, 1]
    
    # Iteratively generate the remaining terms
    for i in range(2, n):
        next_term = fib_sequence[i - 1] + fib_sequence[i - 2]
        fib_sequence.append(next_term)
    
    return fib_sequence

def get_valid_input():
    '''
    This function prompts the user for the number of Fibonacci terms and validates the input.
    It ensures the input is a positive integer between 1 and 10,000.
    
    Returns:
        A valid positive integer for the number of terms
    '''
    while True:
        try:
            user_input = input('Enter the number of Fibonacci terms (1-10,000): ')
            number = int(user_input)
            
            # Validate that the number is positive and within the limit
            if number < 1:
                print('Error: Please enter a positive integer (greater than 0).')
                continue
            elif number > 10000:
                print('Error: The maximum number of terms is 10,000. Please enter a smaller number.')
                continue
            
            return number
        
        except ValueError:
            print('Error: Invalid input. Please enter a valid integer.')
            continue

if __name__ == '__main__':
    # Get valid input from the user
    num_terms = get_valid_input()
    
    # Generate the Fibonacci sequence
    fib_sequence = fibonacci(num_terms)
    
    # Format and display the sequence as a space-separated list
    if fib_sequence:
        print('Fibonacci Sequence:')
        print(' '.join(map(str, fib_sequence)))
    else:
        print('No sequence generated.')