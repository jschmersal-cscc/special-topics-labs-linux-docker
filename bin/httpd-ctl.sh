#!/usr/bin/env bash

DIR="-v /home/oneilm8/Desktop/linux-docker/special-topics-labs-linux-docker/test/:/usr/local/apache2/htdocs/"
PORTOPT="-p 8080:80"

echo "hello"

function HELP {
  echo -e \\n"Help documentation for this script"\\n
  echo -e "Basic usage: httpd-ctl.sh [command] [options]"\\n
  echo -e "Commands are: start, stop, & destroy"\\n
  echo -h "This help menu"
  echo -d "root directory on your system to find www root"
  echo -p "local port you want to be able to access"
}

while getopts 'hd:p:' OPTION; do
  case "$OPTION" in
    h) HELP
    ;;

    d) DIRECTORY="-v $OPTARG:/usr/local/apache2/htdocs/"
      ;;
    p) echo "get port flag"
      PORTOPT="-p $OPTARG:80 "
      ;;
  esac
done

shift $(($OPTIND - 1))

case $1 in

	start)
         echo "starting your docker images"
		 docker run -dit --name my-apache-app $PORTOPT $DIR httpd:2.4
		 ;;
	stop)
	    echo "stopping your docker instances"
        docker stop my-apache-app
		;;
	destroy)
	    echo "stopping and removing your docker instances"
		docker stop my-apache-app
		docker rm my-apache-app
		;;
esac
