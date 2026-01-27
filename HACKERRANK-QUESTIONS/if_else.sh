# Given two integers,  and , identify whether  or  or .

# Exactly one of the following lines:
# - X is less than Y
# - X is greater than Y
# - X is equal to Y

# Input Format

# Two lines containing one integer each ( and , respectively).

read x
read y

if [ $x -gt $y ];
then 
  echo "X is greater than Y"
elif [ $x -lt $y ];
then 
  echo "X is less than Y"
else 
  echo "X is equal to Y"
fi