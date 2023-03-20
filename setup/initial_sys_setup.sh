#! /usr/bin/bash
#
# CONSANA
# ====================
# (C) 2022 RENware Software Systems
#
# this shell install COSANA application under a Linux Debian environment (Ubuntu is recommended)
#

APP_BASE_DIR = "/opt/cosana"


echo "install cosana application..."
echo "*** Please be sure your system is updated ****"
echo "Press any key to continue or cancel with <Ctrl-c> ..."
read xxx



#========================================================
# basic prepare: create cosana directory, user and copy application files
#========================================================
echo "Create application user..."
sudo addusr cosana

echo "Create application directory..."
sudo mkdir $APP_BASE_DIR
sudo chown cosana $APP_BASE_DIR
sudo su cosana

echo "Copy cosana application files..."
# tbd... extract archive in /tmp and move files in $APP_BASE_DIR



#========================================================
# os / platform required files
#========================================================
echo "Install general and useful applications ..."
sudo apt install ufw
sudo apt install nginx



#========================================================
# Install python3 complete environment with venv tool and application infrastructure components
#========================================================
# python
echo "Install python3 complete environment with venv tool ..."
sudo apt-get -y install python3
sudo apt install python3-venv
sudo apt install python3-dev
sudo apt install libpq-dev
sudo apt install python3-pip

echo "Install components for PDF rendering..."
sudo apt install python3-cffi
sudo apt install python3-brotli
sudo apt install libpango-1.0-0
sudo apt install libpangoft2-1.0-0

# redis *** will be used
echo "Install redis ..."
# sudo apt install redis - y

# mail OS independendent complete tool # ************** check if will be needed for notfications
# sudo apt install sendmail

# database # ************** check if will be needed as redis is used as intermediary data warehouse
# sudo apt install postgre - y



#========================================================
# prepare opt directory
#========================================================
echo "Prepare opt directory..."
sudo chown petre -r /opt # TODO change to cosana user
git clone http://192.168.1.54/renstd/cosana
cd /opt/sagrat 

echo "Prepare and install application environment..."
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
deactivate



#========================================================
# copy config files
# TODO check file names and list of necessary configurations
#========================================================
# sudo cp ./run_configs/supervisor/cosana.conf /etc/supervisor/conf.d???
# sudo cp ./run_configs/nginx/sembre_data.conf /etc/nginx/conf.d
# sudo cp ./run_configs/sendmail/sendmail.conf /etc/mail/sendmail.conf



#========================================================
# database first generation
#========================================================
#TODO[petre 211023] use db_scripts/files !!! attn to databse to use correct driver



#========================================================
# open ports
#========================================================
echo "Resolving and activate networking..."
sudo ufw allow 6800/tcp
# TODO more ports...? 
sudo ufw enable
sudo ufw reload


#========================================================
# run system one time or run daemons for autorestart
#========================================================
# sudo nginx reload
# sudo sysstem-ctl supervisor restart


#!FIXME - any more issues ?
# ad-hoc runs ?? need maybe for development


