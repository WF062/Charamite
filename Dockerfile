FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.js (with Corepack) のインストール
RUN apt-get update -qq && \
    apt-get install -y curl gnupg build-essential libpq-dev libssl-dev nodejs python3 cron && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    corepack enable && corepack prepare yarn@4.9.1 --activate

RUN service cron start
RUN mkdir /v3_advanced_rails
WORKDIR /v3_advanced_rails

RUN gem update --system && gem uninstall bundler -a -x && gem install bundler:2.6.8

COPY Gemfile /v3_advanced_rails/Gemfile
COPY Gemfile.lock /v3_advanced_rails/Gemfile.lock
COPY package.json yarn.lock /v3_advanced_rails/

RUN bundle install
RUN yarn install

COPY . /v3_advanced_rails

ENV PATH="/v3_advanced_rails/bin:/usr/local/bundle/bin:$PATH"
