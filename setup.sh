# Update And Install Required Packages
sudo apt update -y && sudo apt upgrade -y \
&& sudo apt install --no-install-recommends -y ca-certificates curl ffmpeg fonts-noto-color-emoji gcc git gnupg libmagickwand-dev libpq-dev mediainfo nano neofetch pv python3 python3-dev python3-lxml python3-pip python3-psycopg2 screen tree unzip virtualenv wget zlib1g libyaml-dev \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && NODE_MAJOR=18 && \
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list && \
sudo apt-get update && sudo apt-get install nodejs postgresql -y
# Re-name exampleconfig.py to config.py and setup
mv exampleconfig.py config.py
sudo su - postgres bash -c "psql -c \"ALTER USER postgres WITH PASSWORD 'your_password';\" && createdb catuserbot -O postgres"
nano config.py