FROM ruby:2.2.4 
MAINTAINER igor2109a@gmail.com

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        nodejs \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/dev
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
RUN rake db:create
RUN rake db:migrate
RUN rake db:seed
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
