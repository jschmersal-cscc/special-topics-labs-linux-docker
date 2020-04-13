
# bash variables are simultaneously simple, surprising, frustrating and complicated.

# variables can be declared by assigning them a value.
VAR1=something

# note the syntax above. bash variable syntax is picky.  You can't have whitespace around the equals sign.  Uncomment the
# following lines one at a time and see what happens when you run this example:

# VAR2 = something
# VAR3= something

# If you want to assign a string with whitespace, you need it to be quoted:
# VAR4=some unquoted string
# VAR4="some unquoted string"

# bash variables are by convention named in ALL_CAPS_WITH_UNDERSCORES, similar to java constants.  If you hear the
# term environment variables, these are simply bash variables that are available in your terminal.

# you can access the value of a variable by expanding it using the $ symbol:
SIMPLE_VARIABLE="a test"
echo "this is $SIMPLE_VARIABLE"

# Sometimes you will see variables printed using curly braces to denote the start and end of the variable name.  This
# is for both readability and to support situations like this.  Run this script... what's wrong with the first echo command here?
echo
PREFIX=pre
echo "this is a $PREFIXposition"
echo "this is a ${PREFIX}position"

# If you don't want to expand your variables in a statement like the echo statements you've seen, you can use
# the single quotes (') instead of double quotes (")
echo
echo 'the value of $PREFIX:'
echo "$PREFIX"

# Arithmetic in bash is hard.  Let's leave it at that, and google is your friend here.

