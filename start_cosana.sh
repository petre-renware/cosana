#!/usr/bin/bash

#**********************************
# Start COSANA application server
#**********************************

echo "Starting COSANA system..."


# kill any prev processes
echo "COSANA laucher - kill any previous processes..."
sudo pkill python3
# next is the version with named process
# sudo pkill -f cosana_web_app_srv
# sudo pkill gunicorn


# start application
echo "COSANA laucher - initializa application..."
.env/bin/python3 main.py # latter will need to be launched in backgroud
# next is the version with named process
# bash -c "exec -a cosana_web_app_srv .env/bin/python3 main.py &"
# .env/bin/gunicorn -w main:app &



echo "COSANA laucher - *** application server launched"

