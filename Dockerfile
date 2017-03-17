FROM ruby:2.3.3

# Get libs for Mysql
RUN apt-get -y update \
	&& apt-get -y install libmysqlclient-dev \
	&& rm -rf /var/lib/apt/lists/*

# Set UTF-8
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /tmp
ADD Gemfile.lock /tmp
ADD Gemfile /tmp
ADD install_phantomjs.sh /tmp

RUN bundle install -j4
RUN sh install_phantomjs.sh
