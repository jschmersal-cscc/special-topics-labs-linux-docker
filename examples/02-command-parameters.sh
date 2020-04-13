
# To run this script, be sure to make it executable!  (See 01-read-write-execute.sh)

# You can get at the command line arguments (or parameters) for a script using built-in shell variables.
# $0 is the command name itself.  Note that it is the command name as entered on the command line, not just the filename.
echo "This script was invoked as: $0"

# You can use $# to get the number of arguments passed:
echo "There are $# arguments passed to this script"


# You can use $* to get the entire list of arguments passed to your script.  Additionally, you can access individual
# parameters by its index.  For example, $1 gives you the first argument, $2 is the second argument, etc.
echo ""
echo "Here is each individual parameter:"
for i in $*; do
  echo "Got parameter: $i"
done

# Run this script with various numbers of parameters.  For example:
# ./02-command-parameters.sh
# ./02-command-parameters.sh two arguments
# ./02-command-parameters.sh this is a longer list of arguments

# As a bonus, try to run this script from different locations.
# For example, you can try running it from the root of the lab (for me this is the ~/repos/special-topics-labs-linux-docker directory).  Notice the difference in $0:
# ./examples/02-command-parameters.sh from a different directory


