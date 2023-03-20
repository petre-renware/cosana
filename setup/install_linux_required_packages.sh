#! /usr/bin/bash
#
# CONSANA
# ====================
# (C) 2022 RENware Software Systems
#
# this shell install minimum requirements for Ubuntu
#





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

