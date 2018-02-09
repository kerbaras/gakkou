# Gakkou

[![Build Status](https://travis-ci.org/matias-pierobon/gakkou.svg?branch=master)](https://travis-ci.org/matias-pierobon/gakkou)
[![license](https://img.shields.io/github/license/matias-pierobon/gakkou.svg)](https://github.com/matias-pierobon/gakkou/blob/master/LICENSE)

Gakkou it's a class managment system design as a main task for a subject at the CS Department of UNLP.

## Installation

Gakkou uses docker for production and development

to run the application you'll need `docker` and `docker-compose`

### Build the app
```bash
docker-compose build
```

### Run the app
```bash
docker-compose up -d
```

### Setup the database
```bash
docker-compose exec web bundle exec rails db:setup
```

### Shutdown
```bash
docker-compose down
```

## Usage

A live demo is setup in a heroku app [https://intense-peak-30761.herokuapp.com/](https://intense-peak-30761.herokuapp.com/)
You may use the username `admin@admin.com` and the password  `123456` to login.
