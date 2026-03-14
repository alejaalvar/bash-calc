#!/bin/bash

#File: test_math.bash
#Author: Alejandro Alvardo
#Breif: Test script for the bash calculator

result=0

# ========== Test addition returns correct sum ==========
result=$(./math.bash -a 5 5)
if ((10 == result)); then
    printf "Add test passed with 5+5\n"
else
    printf "Add test failed with 5+5\n"
fi

# ========== Test addition returns correct sum with zeros ==========
result=$(./math.bash -a 0 0)
if ((0 == result)); then
    printf "Add test passed with zeros\n"
else
    printf "Add test failed with zeros\n"
fi

# ========== Test subtract returns correct difference with zeros ==========
result=$(./math.bash -s 0 0)
if ((0 == result)); then
    printf "Subtract test passed with zeros\n"
else
    printf "Subtract test failed with zeros\n"
fi

# ========== Test subtract returns correct difference with negative result ==========
result=$(./math.bash -s 0 2)
if ((-2 == result)); then
    printf "Subtract test passed with 0 and 2\n"
else
    printf "Subtract test failed with 0 and 2\n"
fi

# ========== Test subtract returns correct difference with 9 and 3 ==========
result=$(./math.bash -s 9 3)
if ((6 == result)); then
    printf "Subtract test passed with 9 and 3\n"
else
    printf "Subtract test failed with 9 and 3\n"
fi

# ========== Test multiply returns correct product with 9 and 3 ==========
result=$(./math.bash -m 9 3)
if ((27 == result)); then
    printf "Multiply test passed with 9 and 3\n"
else
    printf "Multiply test failed with 9 and 3\n"
fi

# ========== Test multiply returns correct product with zeros ==========
result=$(./math.bash -m 0 0)
if ((0 == result)); then
    printf "Multiply test passed with zeros\n"
else
    printf "Multiply test failed with zeros\n"
fi

# ========== Test divide returns exits early when divides by zero ==========
./math.bash -d 0 0 > /dev/null
if (($? == 1)); then
    printf "Divide test passed with zeros\n"
else
    printf "Divide test failed with zeros\n"
fi

# ========== Test divide returns correct quotient with 20 and 4 ==========
result=$(./math.bash -d 20 4)
if (( $(echo "$result == 5.00" | bc) )); then  # bash cannot do floating points, bc CAN
    printf "Divide test passed with 20 and 4\n"
else
    printf "Divide test failed with 20 and 4\n"
fi
