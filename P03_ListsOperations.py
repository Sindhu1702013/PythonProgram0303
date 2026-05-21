# Author: OMKAR PATHAK
# This program determines whether a given number is even or odd
# It includes input validation and supports repeated checks with a user-friendly exit mechanism

def check_even_odd(number):
    """
    Determines whether a given number is even or odd.
    
    Args:
        number (int): The number to check
        
    Returns:
        str: A string indicating whether the number is even or odd
    """
    if number % 2 == 0:
        return f"{number} is an Even number"
    else:
        return f"{number} is an Odd number"


def get_valid_integer():
    """
    Prompts the user for input and validates that it is a valid integer.
    Allows user to enter 'quit' to exit the program.
    
    Returns:
        int or str: The valid integer entered by the user, or 'quit' to exit
    """
    while True:
        user_input = input("
Enter a number (or 'quit' to exit): ").strip()
        
        # Check if user wants to exit
        if user_input.lower() == 'quit':
            return 'quit'
        
        # Check if input is empty
        if not user_input:
            print("Error: Input cannot be empty. Please enter a valid integer.")
            continue
        
        # Try to convert to integer
        try:
            number = int(user_input)
            return number
        except ValueError:
            print(f"Error: '{user_input}' is not a valid integer. Please enter a numeric value.")


def main():
    """
    Main program loop that continuously prompts the user to check if numbers are even or odd.
    """
    print("=" * 50)
    print("Even or Odd Number Checker")
    print("=" * 50)
    
    while True:
        # Get valid integer input from user
        user_number = get_valid_integer()
        
        # Check if user wants to quit
        if user_number == 'quit':
            print("
Thank you for using the Even or Odd Checker. Goodbye!")
            break
        
        # Display the result
        result = check_even_odd(user_number)
        print(result)


if __name__ == "__main__":
    main()

# Author: OMKAR PATHAK

# This program finds the largest of three numbers with robust input validation

def find_largest(num1, num2, num3):
    '''This function returns the largest of three numbers'''
    return max(num1, num2, num3)


if __name__ == '__main__':
    print("Welcome to the Largest of Three Numbers Program!")
    print("=" * 50)
    
    # Input validation loop for first number
    while True:
        try:
            num1_input = input("Enter the first number: ")
            num1 = float(num1_input) if '.' in num1_input else int(num1_input)
            break
        except ValueError:
            print("Error: Please enter a valid numerical value.")
    
    # Input validation loop for second number
    while True:
        try:
            num2_input = input("Enter the second number: ")
            num2 = float(num2_input) if '.' in num2_input else int(num2_input)
            break
        except ValueError:
            print("Error: Please enter a valid numerical value.")
    
    # Input validation loop for third number
    while True:
        try:
            num3_input = input("Enter the third number: ")
            num3 = float(num3_input) if '.' in num3_input else int(num3_input)
            break
        except ValueError:
            print("Error: Please enter a valid numerical value.")
    
    # Find and display the largest number
    result = find_largest(num1, num2, num3)
    print("=" * 50)
    print(f"The largest number is: {result:.2f}")