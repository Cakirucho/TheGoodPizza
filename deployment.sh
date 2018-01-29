#!/bin/bash
# Deployment script for automating the deployment of TheGoodPizza project.
set -e
BUILD=1
EXECUTE=0


function exit_on_error() {
  if [[ $1 == 1 ]]
    then
    echo -e "\n\nError in deployment script."
    exit 1
  fi
}

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


fi

