FROM ruby:2.0.0
ARG RAILS_ENV=development
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY ./sample_app_rails_4/  /myapp/
RUN RAILS_ENV=${RAILS_ENV} bundle install
RUN RAILS_ENV=${RAILS_ENV} bundle exec rake assets:precompile
#RUN bundle exec rake db:migrate

