#!/bin/bash

# setup virtual environment and add dependencies
pipenv install --python 3.8.13

# install python packages
pipenv install flask flask-sqlalchemy flask-migrate python-dotenv ipdb

# filestructures
mkdir server
touch server/app.py
touch server/models.py
touch server/config.py
touch server/seed.py
touch server/debug.py
touch .env
touch .gitignore

# imports config.py
echo "from flask import Flask" >> server/config.py
echo "from flask_sqlalchemy import SQLAlchemy" >> server/config.py
echo "from sqlalchemy import MetaData" >> server/config.py
echo "from flask_migrate import Migrate" >> server/config.py
echo "from dotenv import load_dotenv" >> server/config.py
echo -e "import os\n" >> server/config.py

# configuring config.py
echo -e "load_dotenv()\n" >> server/config.py

echo -e "naming_convention = {
    \"ix\": \"ix_%(column_0_label)s\",
    \"uq\": \"uq_%(table_name)s_%(column_0_name)s\",
    \"ck\": \"ck_%(table_name)s_%(constraint_name)s\",
    \"fk\": \"fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s\",
    \"pk\": \"pk_%(table_name)s\",
}\n" >> server/config.py
echo -e "metadata = MetaData(naming_convention=naming_convention)\n" >> server/config.py
echo "app = Flask(__name__)" >> server/config.py
echo "app.config[\"SQLALCHEMY_DATABASE_URI\"] = os.getenv(\"DATABASE_URI\")" >> server/config.py
echo -e "app.config[\"SQLALCHEMY_TRACK_MODIFICATIONS\"] = False\n" >> server/config.py
echo -e "db = SQLAlchemy(app=app, metadata=metadata)\n" >> server/config.py
echo -e "migrate = Migrate(app=app, db=db)\n" >> server/config.py

# imports models.py
echo -e "from config import db\n" >> server/models.py

# imports app.py
echo -e "from config import app, migrate\n" >> server/app.py
echo -e "from models import db\n" >> server/app.py

# configuring app.py
echo "if __name__ == \"__main__\":" >> server/app.py
echo "  with app.app_context():" >> server/app.py
echo "    migrate.init_app(app, db)" >> server/app.py
echo "    pass" >> server/app.py
echo "    # remove pass and write your cli logic" >> server/app.py

# configuring seed.py
echo -e "from config import app\n" >> server/seed.py
echo -e "from models import *\n" >> server/seed.py
echo "if __name__ == \"__main__\":" >> server/seed.py
echo "  with app.app_context():" >> server/seed.py
echo "    pass" >> server/seed.py
echo "    # remove pass and write your seed data" >> server/seed.py

# configuring debug.py
echo -e "import sys\n" >> server/debug.py
echo -e "import ipdb\n" >> server/debug.py
echo -e "from config import app\n" >> server/debug.py
echo -e "from models import *\n" >> server/debug.py
echo "if __name__ == \"__main__\":" >> server/debug.py
echo "  with app.app_context():" >> server/debug.py
echo "    pass" >> server/debug.py
echo "    # remove pass and write your debug implementation" >> server/debug.py
echo "  ipdb.set_trace(sys._getframe())" >> server/debug.py



# configuring .gitignore
echo ".env" >> .gitignore

# configuring .env
echo "DATABASE_URI=sqlite:///app.db" >> .env

# initializing database
cd server
export FLASK_APP=app.py

pipenv run flask db init
pipenv run flask db revision -m 'initial db'
pipenv run flask db upgrade head

cd ..

touch README.md

echo "# Project Name Here" >> README.md
echo "Fill out your project details here in your README.md" >> README.md

git init
git add .
git commit -m 'initial commit'