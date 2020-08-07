echo "Install SQLite3"
sudo apt-get install -y sqlite3

# run this command before install pycurl
sudo apt install libcurl4-openssl-dev libssl-dev

# Working on virtual environment
if [ "$#" -ne 2 ]; then
    echo "Usage: $0  <method> <Virtual Env>"
    exit
fi

method="$1"
env_name="$2"

echo ""

if [ $method == "pip" ];then
    echo "Activate virtual environment by using virtualwrapenv"
    source `which virtualenvwrapper.sh`
    mkvirtualenv $env_name -p python3
    source $HOME/.virtualenvs/$env_name/bin/activate
    workon $env_name
elif [ $method == "conda"];then
    echo "Activate virtual environment by using conda"
    conda create -n $env_name python=3.6
    conda activate $env_name
else 
    echo "Insert pip or conda in order to create virtual environment"
fi

pip install -r requirements.txt