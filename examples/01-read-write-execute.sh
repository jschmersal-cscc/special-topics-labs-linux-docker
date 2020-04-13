
# First, a couple basics:
#  1) This is a comment, because the line starts with a #
#  2) A shell script is essentially a list of shell commands in a given file (such as this file)
#  3) File permissions are engrained in Linux.  Every file or directory has a 3x3 matrix of permissions:
#    a) one dimension is file privileges ('r', 'w', or 'x'): read privilege, write, and execute
#    b) the other dimension is who has that privelege ('u', 'g', or 'o'): the user that currently owns the file, members of the file's assigned group, or anyone
#    c) when you run the 'ls -l' command, it lists files with their current permissions.  See 'ls' for more information
#    d) files usually aren't executable by default.  Use the chmod command to change permissions for a given file.  

# To make this file executable, run the following at the command line (from the examples directory).  Be sure to not include the leading # or it will be a comment and nothing will happen!

#    chmod u+x 01-read-write-execute.sh

# After doing so, in the same directory type:

#    ./01-read-write-execute.sh

# Check the output to ensure the command worked

echo "Well done - you can execute this script now!!!"
