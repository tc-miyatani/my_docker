FROM ruby:2.6.5

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn \
    && gem uninstall bundler \
    && gem install bundler -v 2.1.4

RUN mkdir /myapp
WORKDIR   /myapp
COPY Gemfile      /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY ./myapp /myapp
