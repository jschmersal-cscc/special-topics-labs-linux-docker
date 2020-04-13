# Special Topics Linux/Docker Labs

## Objective

For this lab, you will learn a little more about writing and executing shell scripts.  You will also gain a little hands-on experience with docker commands to manage containers.

Shell scripts are pervasive in Linux work environments.  Java applications _mostly_ run on Linux 
these days, so familiarity with shell scripts is a valuable skill.  One common use case developers 
encounter is the need for a script to aid in starting or stopping your application.  We'll create a 
basic start/stop script for the [Apache Httpd](https://httpd.apache.org/) web server.  It is quite
common for organizations to provide a container-ready version of their application packaged as a 
[docker image]() ready to be consumed by end users.  Conveniently, Apache has such a [docker image
for httpd](https://hub.docker.com/_/httpd) ready for your use.


## Getting Started:

1. Copy the starter code from here into a new, private repository in your personal GitHub account using [these instructions](https://github.com/jschmersal-cscc/lab0-completing-and-submitting-assignments) substituting this repository URL ``https://github.com/jschmersal-cscc/special-topics-labs-linux-docker.git`` for the one referenced in that document.  Also, when adding a collaborator be sure to specify my user name (`jschmersal-cscc`) instead of Jeff's.
2. Create a new branch for your code changes as described in [these instructions](https://github.com/jschmersal-cscc/lab0-completing-and-submitting-assignments#important-before-you-start-coding)


## Completing the Assignment

#### The goal of this assignment is to create a shell script that controls an application (Apache Httpd) with docker commands.
1. Your shell script should be called ``httpd-ctl.sh`` and it should be in the ``bin`` subdirectory of this repo
1. Your script should accept the following options (*Hint* [getopts](http://pubs.opengroup.org/onlinepubs/9699919799.2018edition/utilities/getopts.html) is a bash built-in function that helps you process command-line arguments.  You can find a simple tutorial [here](examples/05-getopts.sh)).
    * `-h` - (optional argument) display help and exit with an exit code 0.  The help should look similar to what you see when you pass `--help` to standard commands (e.g. `grep --help`).  *Hint*: It's frequently helpful to create a `usage` [function](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-8.html) that prints out the correct command usage.
    * `-d <directory>` - (optional argument) uses the specified directory as the directory containing the content for the web server to serve.  If the `-d` parameter isn't used then no volume mount should be used.  You can test this by running `bin/httpd-ctl.sh -d $PWD/www start`
    * `-p <port>` - (optional argument) specifies the port httpd should listen on when starting.  The default port (if the `-p` option is not specified) should be `8080`.
1. The final argument should be `<command>`.  It is required and must be one of `start`, `stop`, or `destroy`.  `start` will start your httpd instance.  `stop` will stop the instance, but not remove the container.  `destroy` will stop any running instance and remove the associated container.  Thus, the simplest form of running your script to start httpd should be `./httpd-ctl.sh start` (assuming you're in the `bin/` subdirectory of this repository).
1. Your script _must_ use `docker` to start and stop your httpd instances.
1. You should test that your script works by navigating your browser (within your workspace!) to your server, and of course you should test all of the parameters.  The hostname to put in the url should be `localhost`, so you should be able to point your browser to [http://localhost:8080] if you start your httpd with your default settings.
1. You will need to [volume mount](https://docs.docker.com/storage/volumes/) the value passed as the `-d` parameter, if it is specified (just use the `-v` option to the `docker` command used to start your container). 
1. You should run your service in the background (i.e. [Detached mode](https://docs.docker.com/engine/reference/run/#detached--d)).  Try running your container both with and without the detached mode.  Can you think of times when you would want to run one way or the other?

## Hints
1. Your reading assignments include overviews of writing shell scripts.  I suggest you read through them to get a good intro to the topic, beyond what was covered in class.  There are also [examples](examples/) in this repo.
1. Remember that in order to run a script in linux, it needs to be [marked executable](examples/01-read-write-execute.sh).
1. I would suggest you develop your script in multiple phases, to make it easier.  For example:
    1. Have your shell script invoke `docker`.  You can start by hardcoding the `docker start` command, and verifying you can start a container with your script.
    2. Add [a switch](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_03.html) in your shell script to handle the `start`/`stop`/`destroy` options
    3. Finally, add in the other command line arguments you need to support.
1. Note that your `httpd-ctl.sh` script takes "start", but `docker` has multiple different operations regarding running containers.  You will need
to understand the differences here.
1. It is safe for you to assume that commands will be run in a reasonable order.  There's _no need to check_, for example, that a container is not already running when someone issues the `start` command.  A failure in that scenario is reasonable for this lab.  Similarly, attempts to `stop` or `destroy` when there is no container running can fail.  If you want some guidance on how to bullet proof these types of scenarios, see me after class or during office hours.
1. The command we ran during class to start an httpd container can be found in the [httpd docker hub](https://hub.docker.com/_/httpd).  For reference it was `docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4`

## Submitting Your Work

1. Create a pull request for your branch using [these instructions](https://github.com/jschmersal-cscc/lab0-completing-and-submitting-assignments#push-your-changes-and-create-a-pull-request-for-grading)
1. Submit the assignment in Blackboard as described in [these instructions](https://github.com/jschmersal-cscc/lab0-completing-and-submitting-assignments#once-your-pull-request-is-reviewed-and-approved)

__NOTE: I will provide feedback via. comments in your pull request.__
If you need to amend your work after you issue your initial pull request:

1. Commit your updates
1. Push your changes to gitHub
1. Verify the new commits were automatically added to your open pull request
