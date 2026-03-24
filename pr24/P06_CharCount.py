#Author: OMKAR PATHAK
#This program checks for the character frequency in the given string

def charFrequency(requirement_ai):
    '''This fuction helps to count the char frequency in the given string '''
    requirement_ai = requirement_ai.lower() #covert to lowercase
    dict = {}
    for char in requirement_ai:
        keys = dict.keys()
        if char in keys:
            dict[char] += 1
        else:
            dict[char] = 1
    return dict

if __name__ == '__main__':
    requirement_ai = str(input('Enter a string: '))
    print(charFrequency(requirement_ai))
