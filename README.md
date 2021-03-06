# Computer Science Flash Cards

Part of my daily plan on studying data structure and algorithms

- general cs knowledge
    - vocabulary
    - definitions of processes
    - powers of 2
    - design patterns
    - sql
- code
    - data structures
    - algorithms
    - solving problems
    - bitwise operations
- others
    - korean (currently working)
---
## Prerequisites
- Python3
- SQLite3
- virtualenvwrapper for creating python virtual environment
---

## Important Note

## Database
  * **cards-jwasham.db** includes 1,972 cards
  * **cards-jwasham-extreme.db**
 

## How to convert to Anki or CSV

If you don't want to run a server, you can simply use Anki or a similar service/app. Use this script to convert from my sets (SQLite .db file), or yours, to CSV:

https://github.com/eyedol/tools/blob/master/anki_data_builder.py

Thanks [@eyedol](https://github.com/eyedol)


## How to run it on local host (Quick Guide)

*Provided by [@devyash](https://github.com/devyash) - devyashsanghai@gmail.com - Reach out to this contributor if you have trouble.*

1. Install dependencies:
  1. Install [Python ](https://www.python.org/download/releases/2.7/)
  2. Add python as environment variable [windows](http://stackoverflow.com/questions/3701646/how-to-add-to-the-pythonpath-in-windows-7)
  3. To install pip, securely download [get-pip.py](https://bootstrap.pypa.io/get-pip.py)
  4. Run ```python get-pip.py```in terminal
  5. Add pip to your PATH system variable [windows](https://stackoverflow.com/questions/23708898/pip-is-not-recognized-as-an-internal-or-external-command)
  6. Run ``` bash install_env.sh ``` in terminal after going to correct folder
2. Open flash_cards.py and uncomment the line 52-55 beginning from ``` @app.route('/initdb')```
3. Type ```python flash_cards.py``` - if you get error for flask then use ```python -m pip install Flask``` first then run ```flash_card.py``` file 
4. Open localhost:5000/initdb
5. Login using id:USERNAME='admin', PASSWORD='default. 
6. Comment the line 52-55 in flash_cards.py

**NOTE:** If you wish to use John's flash cards then also do following steps:
1. Copy db files such as ```cards-jwasham-extreme``` OR ```cards-jwasham``` and paste them in db folder
2. Edit file ```flash_cards.py``` line 11 and replace cards with any of the other database files
3. Repeat the above steps from step 3
Every time you wish to run your db just open folder in terminal and run  ```python flash_cards.py```

## How to run with Docker

*Provided by [@Tinpee](https://github.com/tinpee) - tinpee.dev@gmail.com - Reach out to this contributor if you have trouble.*

__Make sure you already installed [docker](https://www.docker.com)__

1. Clone project to any where you want and go to source folder.
1. Edit the config.txt file. Change the secret key, username and password. The username and password will be the login 
    for your site. There is only one user - you.
1. Build image: `docker build . -t cs-flash-cards`
1. Run container: `docker run -d -p 8000:8000 --name cs-flash-cards cs-flash-cards`
1. Go your browser and type `http://localhost:8000`

__If you already had a backup file `cards.db`. Run following command:__
*Note: We don't need to rebuild image, just delete old container if you already built.*
`docker run -d -p 8000:8000 --name cs-flash-cards -v <path_to_folder_contains_cards_db>:/src/db cs-flash-cards`.
`<path_to_folder_contains_cards_db>`: is the full path contains `cards.db`.
Example: `/home/tinpee/cs-flash-cards/db`, and `cards.db` is inside this folder.

For convenience, if you don't have `cards.db`, this container will auto copy a new one from `cards-empty.db`.

---

### How to backup data ?
We just need store `cards.db` file, and don't need any sql command.
- If you run container with `-v <folder_db>:/src/db` just go to `folder_db` and store `cards.db` anywhere you want.
- Without `-v flag`. Type: `docker cp <name_of_container>:/src/db/cards.db /path/to/save`

### How to restore data ?
- Delete old container (not image): `docker rm cs-flash-cards`
- Build a new one with `-v flag`:
`docker run -d -p 8000:8000 --name cs-flash-cards -v <path_to_folder_contains_cards_db>:/src/db cs-flash-cards`
- Voila :)

### How to deploy docker file on heroku

- first install [heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- change `entrypoint.sh`
```
- export CARDS_SETTINGS=/src/config.txt
gunicorn --bind  0.0.0.0:$8000 flash_cards:app
+ export CARDS_SETTINGS=/src/config.txt
gunicorn --bind  0.0.0.0:$PORT flash_cards:app
```
- deploy docker file with following commands

```shell
heroku login
heroku container:login
heroku create 
# Creating app... done, ⬢ your-app-name
heroku container:push web --app your-app-name
heroku container:release web --app your-app-name
heroku open --app your-app-name
```
---
## Acknowledge

Thanks to 
 * [@jwashsam](https://github.com/jwasham/computer-science-flash-cards) 
 * [@ashwanikumar04](https://github.com/ashwanikumar04) put together an alternative flash cards site running Node: https://github.com/ashwanikumar04/flash-cards



