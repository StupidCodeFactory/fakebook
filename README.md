[![CircleCI](https://circleci.com/gh/StupidCodeFactory/fakebook.svg?style=svg)](https://circleci.com/gh/StupidCodeFactory/fakebook)

### Demo

The project is deployed on Heroku at this [url](https://morning-escarpment-46963.herokuapp.com)

### How to run
Install docker, docker-compose and direnv

```bash
$ docker-compose up --build
$ docker-compose exec app rails db:create db:setup
$ docker-compose run app rake
```
