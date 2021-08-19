FROM kamiyakei/rails_mysql

COPY Gemfile      /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install \
  && apt update -y
