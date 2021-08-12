FROM node:16.6.1 AS yarn

FROM ruby:2.6.5
COPY --from=yarn /usr/local/bin/node /usr/local/bin/
COPY --from=yarn /usr/local/bin/nodejs  /usr/local/bin/
COPY --from=yarn /usr/local/lib/node_modules/npm/bin/npm /usr/local/bin/
RUN mkdir -p /usr/local/bin/node_modules/ \
    && ln -s /opt/yarn/bin/yarn    /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg
COPY --from=yarn /usr/local/lib/node_modules/npm /usr/local/bin/node_modules/npm
COPY --from=yarn /opt/yarn-v1.22.5 /opt/yarn

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && gem uninstall bundler \
    && gem install bundler -v 2.1.4

RUN mkdir /myapp
WORKDIR   /myapp
COPY ./myapp/Gemfile      /myapp/Gemfile
COPY ./myapp/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
