#!/bin/bash
# Deployment script for automating the deployment of TheGoodPizza project.
function show_usage_info() {
    echo -e "
  Usage: bash deployment.sh [[-b|--build]

      -b --build
      Build project (install all dependencies etc) and then put up web.

      Leave options blank to put up the web (without building it).
  "
    exit
}

set -e
BUILD=0
EXECUTE=1

function exit_on_error() {
  if [[ $1 == 1 ]]
    then
    echo -e "\n\nError in deployment script."
    exit 1
  fi
}

# Read command line options.
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -b|--build )
      BUILD=1
      ;;
    *)
      show_usage_info
      ;;
  esac
  shift
done

if [[ $BUILD == "1" ]]; then
  echo -e "\n*** Installing necessary libraries/building project ***"

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Installing essentials ***"
  echo "-------------------------------------"
  sudo apt-get update -qq
  sudo apt-get -qq install build-essential software-properties-common
  sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Installing dependencies ***"
  echo "-------------------------------------"
  sudo apt-get -qq install mysql-client libmysqlclient-dev mysql-server
  sudo apt-get -qq install libxslt-dev libxml2-dev
  sudo apt-get -qq install nodejs

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Installing RVM, Ruby and Bundler ***"
  echo "-------------------------------------"
  sudo apt-get -qq install curl git libxml2

  sudo apt-get install ruby-full
  sudo gem install rails
  sudo gem install bundler --no-ri -no-rdoc

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Installing mysql2 ***"
  echo "-------------------------------------"
  sudo gem install mysql2

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Building gems ***"
  echo "-------------------------------------"
  sudo bundle install --path vendor/bundle

  exit_on_error $?
fi

if [[ $EXECUTE == "1" ]]; then
  echo -e "\n*** Deploying application, localhost:3000 ***"

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Starting mysql server ***"
  echo "-------------------------------------"
  sudo service mysql start

  echo -e "\n\n"
  echo "-------------------------------------"
  echo "*** Starting application ***"
  echo "-------------------------------------"
  bundle exec spring rails server

  exit_on_error $?
fi

