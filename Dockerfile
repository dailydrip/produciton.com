FROM ruby:2.4.2

ENV APP_HOME /myapp \ PGDBNAME="produciton" \
          GITHUB_KEY="key" \
          GITHUB_SECRET="secret" \
          PRODUCITON_EMAIL="produciton@example.com"

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

ENTRYPOINT ["rails", "s"]
