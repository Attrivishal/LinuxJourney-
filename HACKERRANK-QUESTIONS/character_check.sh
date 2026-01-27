# Read in one character from STDIN.
# If the character is 'Y' or 'y' display "YES".
# If the character is 'N' or 'n' display "NO".
# No other character will be provided as input.


read char 

if [[ $char == [Yy] ]];
then 
    echo "YES"
elif [[ $char == [Nn] ]];
then
    echo "NO"
fi

# Explanation
# here we are using read command to take input from user and storing it in a variable called char
# then we are using if-elif-else statement to check whether the input character is 'Y' or 'y' or 'N' or 'n' and printing the corresponding output


