
# Next up - conditionals

# Conditionals are another fairly complicated subject in bash, mostly due to many possible ways to 
# express the conditional.  My tip: find something that works for you and keep doing it.  However,
# always be sure to test all possibilities for a condition.

# Most conditions you'll find are simple string and numeric comparisons.  Here's a basic numeric comparison:

if [ $# -eq 0 ]
then
  echo "You didn't pass any arguments to this command!"
  exit 1
fi

# A simple string comparison can be done like this:
if [[ "$1" == a* ]]
then
  echo "$1 starts with 'a'"
elif [[ "$1" == z* ]]
then
  echo "$1 starts with 'z'"
else
  echo "$1 doesn't start with 'a' or 'z'!"
fi

# If statements can be nested.  
if [[ "$1" == a* ]]
then
  if [[ "$1" == ab* ]]
  then
    echo "In fact, $1 starts with 'ab'!"
  fi
fi

# You can also do compound conditions, short-circuit execution, and other useful operations.  Loops (while/for)
# behave similarly to simple if statements as one would expect.

# For further reference, I suggest reading through https://tldp.org/LDP/Bash-Beginners-Guide/html/chap_07.html
