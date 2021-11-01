# THP_Gossip-PostgreSQL-VIEWS

## Purpose
Exemple of routes with PostgreSQL and Ruby on Rails app

## Installation
  * Begin to install gems with a classic :
 $```bundle install```
  * To reset the database execute the command :   
 $```rake db:drop db:create db:migrate``` 
  * then create classes
 $```rails db:migrate ```
  * and populate the database
 $```rails db:seed```

 ## Getting started
  * run the server
 $```rails server```
  * if problem with error : 
  _createuser: error: connection to server on socket "/var/run/postgresql/.s.PGSQL.5432"_ 
 $```sudo service postgresql start```
  * Local site on
 ```http://localhost:3000/home```
