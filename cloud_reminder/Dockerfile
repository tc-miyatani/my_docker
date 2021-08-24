FROM base_docker_rails_mysql

COPY Gemfile      /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json /myapp/package.json
RUN  apt update -y \
  && bundle install \
  && yarn install
