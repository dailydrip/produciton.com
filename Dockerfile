FROM ruby:2.4.2

ENV APP_HOME /myapp \
	PGDBNAME="produciton" \
	GITHUB_KEY="key" \
	GITHUB_SECRET="secret" \
	PRODUCITON_EMAIL="produciton@example.com"

RUN apt-get update -qq \
	&& apt-get install -y \
		build-essential \
		libpq-dev \
		libqt4-webkit \
		libqt4-dev \
		xvfb \
		nodejs \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf \
		/var/lib/apt \
		/var/lib/dpkg \
		/var/lib/cache \
		/var/lib/log

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

ENTRYPOINT ["rails", "s"]
