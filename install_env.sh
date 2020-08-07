echo "Install SQLite3"
sudo apt-get install -y sqlite3

# run this command before install pycurl
sudo apt install libcurl4-openssl-dev libssl-dev

# Working on virtual environment
if [ "$#" -ne 1 ]; then
    echo "Usage: $0  <Virtual Env>"
    exit
fi

env_name="$1"

echo "Activate virtual environment"

source `which virtualenvwrapper.sh`
mkvirtualenv $env_name -p python3
source $HOME/.virtualenvs/$env_name/bin/activate
workon $env_name

pip install -r requirements.txt