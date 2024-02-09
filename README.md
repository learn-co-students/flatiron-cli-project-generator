# Simple Flask Project Generator for Flatiron School

This script is for generating a barebone phase 4 project that's already configured for Flask with a React frontend.

### The project generator will:
* Create your pipenv virtual environment
* Create and configure a barebone flask application
* Install all needed packages for your flask application
* Initializes your sqlalchemy database, so no need to flask db init or create your base revision
* Create a README
* Make your initial commit for you
 
### The project generator will not:
* Connect your project to github, you will still need to create a new repository in github
* Fill out your README.md for you, you will still need to fill this out
* Add any additional packages you want to add for Flask. You will do that as normal
* Automatically put you into your pipenv shell, you will need to run that command in order to be in your virtual environment

### How to use

* Create a directory for your project and cd into your project
* open up the terminal in your project directory (make sure your terminal shows the project directory)
* run in the terminal:
```
 curl -s https://raw.githubusercontent.com/learn-co-students/flatiron-cli-project-generator/main/script.sh | bash
```
* Grab some popcorn

### What to do now that it's done running?

You're Flask CLI project is ready to go! Create models / seeds / etc... You will not have to worry about initializing your database with flask db init, flask db revision -m 'initial db', flask db upgrade head. That is already done for you! You will however need to: `cd server`, use `pipenv shell` in order to go into your virtual environment, run `python app.py` to run your cli application. 

