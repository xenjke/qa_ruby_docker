FROM ruby:2.3.3

# updating apt-get
RUN apt-get -y update

# Get libs for Mysql
RUN apt-get -y install libmysqlclient-dev

# Get capybara requirements
RUN apt-get -y install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

# should be made after all apt-get is done
# Clearing installation leftovers
RUN rm -rf /var/lib/apt/lists/*

# Seting UTF-8
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# copying files to tmp
WORKDIR /tmp
ADD Gemfile.lock /tmp
ADD Gemfile /tmp
ADD install_phantomjs.sh /tmp

# installing gems
RUN bundle install -j4

# installing phantomjs
RUN sh install_phantomjs.sh
