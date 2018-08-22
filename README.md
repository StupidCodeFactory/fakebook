[![CircleCI](https://circleci.com/gh/StupidCodeFactory/fakebook.svg?style=svg)](https://circleci.com/gh/StupidCodeFactory/fakebook)


### How to run
Install docker, docker-compose and direnv

    ```bash
    $ docker-compose up --build
    $ docker-compose exec app rails db:create db:setup
    ```
