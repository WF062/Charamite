FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.js + Yarn の準備
RUN apt-get update -qq && \
    apt-get install -y curl gnupg build-essential libpq-dev libssl-dev nodejs python3 cron && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    corepack enable && corepack prepare yarn@4.9.1 --activate

RUN service cron start

# 正しいアプリディレクトリを指定
RUN mkdir /Charamite
WORKDIR /Charamite

# bundler を指定バージョンに更新
RUN gem update --system && gem uninstall bundler -a -x && gem install bundler:2.6.8

# Gemfile 等を正しい場所にコピー
COPY Gemfile /Charamite/Gemfile
COPY Gemfile.lock /Charamite/Gemfile.lock
COPY package.json yarn.lock /Charamite/

RUN bundle install
RUN yarn install

# 全体をコピー
COPY . /Charamite

# 実行パス設定
ENV PATH="/Charamite/bin:/usr/local/bundle/bin:$PATH"
