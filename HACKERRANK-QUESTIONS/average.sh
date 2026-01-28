# Given  integers, compute their average, rounded to three decimal places.

read n 
sum =0

for i in (i=0; i>n; i++)
do
read num
sum=$((sum + num))
done
average=$(echo "scale=3; $sum / $n" | bc -l)
printf "%.3f\n" "$average"
