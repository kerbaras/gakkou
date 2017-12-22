FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /gakkou
WORKDIR /gakkou

COPY Gemfile /gakkou/Gemfile
COPY Gemfile.lock /gakkou/Gemfile.lock

RUN bundle install

COPY . /gakkou
