FROM my_docker_rails_mysql

COPY Gemfile      /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install \
  && apt update -y
  # && apt install -y cron \
  # && service cron start

# COPY ./cron_reminder.sh /root/cron_reminder.sh
# RUN chmod +x            /root/cron_reminder.sh
# COPY ./crontab /var/spool/cron/crontabs/root
# RUN chmod 0644 /var/spool/cron/crontabs/root
# RUN service cron restart
