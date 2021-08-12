FROM node AS yarn

FROM ruby AS bundler
RUN gem uninstall bundler \
    && gem install bundler -v 2.1.4

FROM ruby:2.6.5
COPY --from=yarn /usr/local/bin/node /usr/local/bin/
COPY --from=yarn /usr/local/bin/npm  /usr/local/bin/
COPY --from=yarn /usr/local/bin/yarn /usr/local/bin/
COPY --from=yarn /opt/yarn-v1.22.5/bin/yarn.cmd   /usr/local/bin/
COPY --from=yarn /opt/yarn-v1.22.5/bin/yarn.js    /usr/local/bin/
COPY --from=bundler /usr/local/bin/bundler        /usr/local/bin/bundler
COPY --from=bundler /usr/local/bundle/bin/bundler /usr/local/bundle/bin/bundler

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR   /myapp
COPY ./myapp/Gemfile      /myapp/Gemfile
COPY ./myapp/Gemfile.lock /myapp/Gemfile.lock
# RUN bundle install
# COPY ./myapp /myapp
