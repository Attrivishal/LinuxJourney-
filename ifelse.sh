#######################
# How to write if else in script
#####################
#!/bin/bash

a=2
b=3

# Correct comparison syntax for numbers
if [ $a -lt $b ]
then
    echo "a is greater than b"
else
    echo "a is smaller than b"
fi

# For numbers:
[ $a -eq $b ]  # Equal
[ $a -ne $b ]  # Not equal
[ $a -lt $b ]  # Less than
[ $a -le $b ]  # Less than or equal
[ $a -gt $b ]  # Greater than
[ $a -ge $b ]  # Greater than or equal

#For strings:
[ "$a" = "$b" ]   # Equal
[ "$a" != "$b" ]  # Not equal
[ "$a" \< "$b" ]  # Less than (alphabetically)
[ "$a" \> "$b" ]  # Greater than (alphabetically)
[ -z "$a" ]       # String is empty
[ -n "$a" ]       # String is not empty
