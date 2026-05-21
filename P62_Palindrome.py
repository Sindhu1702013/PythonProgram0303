

# Author: OMKAR PATHAK

# PALINDROME: A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization)

import re

def is_palindrome(text):
    """
    Determines whether a given string is a palindrome.
    
    Normalizes the input by removing non-alphanumeric characters and converting to lowercase,
    then compares the normalized string with its reverse.
    
    Args:
        text (str): The string to check for palindrome property
        
    Returns:
        bool: True if the text is a palindrome, False otherwise
    """
    # Remove non-alphanumeric characters and convert to lowercase
    normalized = re.sub(r'[^a-z0-9]', '', text.lower())
    
    # Compare the normalized string with its reverse
    return normalized == normalized[::-1]

if __name__ == '__main__':
    # Test cases for standard palindromes
    assert is_palindrome("racecar") == True
    assert is_palindrome("A man, a plan, a canal: Panama") == True
    assert is_palindrome("race a car") == False
    assert is_palindrome("0P") == False
    
    # Test cases for edge cases
    assert is_palindrome("") == True
    assert is_palindrome(" ") == True
    assert is_palindrome("a") == True
    assert is_palindrome("ab") == False
    assert is_palindrome("aa") == True
    
    # Test cases with special characters and spaces
    assert is_palindrome("A1b2B1a") == True
    assert is_palindrome("12321") == True
    assert is_palindrome("12345") == False
    assert is_palindrome("Was it a car or a cat I saw?") == True
    assert is_palindrome("Madam, I'm Adam") == True
    assert is_palindrome("hello") == False
    
    # Test cases for non-palindromes
    assert is_palindrome("python") == False
    assert is_palindrome("programming") == False
    assert is_palindrome("12345678") == False
    
    print("All test cases passed!")

# Author: OMKAR PATHAK
# This program reverses a string using string slicing

def reverse_string(string):
    '''This function reverses the string passed as argument using slicing'''
    return string[::-1]

if __name__ == '__main__':
    user_input = input('Enter a string: ')
    reversed_result = reverse_string(user_input)
    print(f'Reversed string: {reversed_result}')