FROM ruby:2.2.4 
MAINTAINER igor2109a@gmail.com

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/dev
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
