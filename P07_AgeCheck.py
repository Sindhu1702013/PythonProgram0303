def greet_user():
    """Ask for the user's name and greet them."""
    name = input("Enter your name: ").strip()
    if not name:
        print("Name cannot be empty!")
        return greet_user()  # Recursive call until valid name
    print(f"\nHello, {name}! Welcome to Python.\n")
    return name

def check_age():
    """Ask for the user's age and give a response based on age."""
    try:
        age = int(input("Enter your age: "))
        if age < 0:
            print("Age cannot be negative. Try again.")
            return check_age()
        elif age < 18:
            print("You're young! Keep learning and exploring.")
        elif age < 50:
            print("Great! Keep honing your skills.")
        else:
            print("Experience matters! Keep sharing knowledge.")
    except ValueError:
        print("Please enter a valid number.")
        return check_age()

def main():
    greet_user()
    check_age()
    print("\nThank you for using this program. Have a great day!")

if __name__ == "__main__":
    main()