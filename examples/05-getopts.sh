
# Parsing command-line arguments can be quite tedious, but is a very common thing
# for a shell script to need to do.  Luckily, bash comes with a function, getopts,
# that is meant to make this job easier.  It does have quite a bit to it though.


# These are a couple variables I'm going to use to store information I gleen from the command line
O_FLAG_SET=false
P_FLAG_SET=false
P_VALUE=

# This is a function in bash. FYI - you don't have to declare function parameters in
# bash (and you address them as $1, $2, $3, etc.).  
usage() { 
  # arguments in [] signals that is an optional argument.  This script has 2 optoinal arguments,
  # one (-o) doesn't have an associated value, but the other (-p) does.
  echo "Usage: $0 [-o] [-p <string>] [<string>]"
  exit 1
}

# Here's where things get interesting.  Most getopts uses will be in a while loop, with the parsed
# option acted upon in a case statement.  Note here that getopts has two arguments, the first is a
# string containing information about which options to expect, the second is a variable name to store
# the parsed option in.  In this example, "op:", there are two possible options ('o' and 'p').  The
# second ('p') option is expecting a value to be passed to it - that's why it has the ':' following it.
while getopts "op:" opt; do
    case "${opt}" in
        o)
            # If I'm here then the user passed "-o" as an option to my script
            O_FLAG_SET=true
            ;;
        p)
            # If I'm here then the user passed "-p <somevalue>" as an option to my script
            P_FLAG_SET=true
            P_VALUE=${OPTARG}
            ;;
        *)
            # If I'm here then the user passed something other than the expected options
            usage
            ;;
    esac
done

# As getopts processes options it updates an internal counter, OPTIND, of the number of command-line
# arguments it has handled.  Sometimes you want to read values after the optional values.  To do so,
# you can use the 'shift' command to bypass what getopts has handled and see what else is there.
shift $((OPTIND-1))

if [ "$O_FLAG_SET" == "true" ]
then
  echo "The -o flag is set!"
fi

if [ "$P_FLAG_SET" == "true" ]; then
    echo "The -p flag is set and the value passsed for -p is: $P_VALUE"
fi

if [ -n "$1" ]
then
  echo "There was more passed to the command after parsing options... here's the first bit: $1"
fi

# Try running this command with multiple combinations:
# ./05-getopts.sh -o -p hello goodbye
# ./05-getopts.sh -p bells -o yo
# ./05-getopts.sh -o 
# ./05-getopts.sh -o -p 
# ./05-getopts.sh hmm...


