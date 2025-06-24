FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update -qq && \
    apt-get install -y curl gnupg build-essential libpq-dev libssl-dev nodejs python3 cron && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    corepack enable && corepack prepare yarn@4.9.1 --activate

RUN service cron start

RUN mkdir /Charamite
WORKDIR /Charamite

RUN gem update --system && gem uninstall bundler -a -x && gem install bundler:2.6.8

COPY Gemfile /Charamite/Gemfile
COPY Gemfile.lock /Charamite/Gemfile.lock
COPY package.json yarn.lock /Charamite/

RUN bundle install
RUN yarn install

COPY . /Charamite

ENV PATH="/Charamite/bin:/usr/local/bundle/bin:$PATH"
