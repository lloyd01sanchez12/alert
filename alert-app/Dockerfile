FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /alert

WORKDIR /alert
COPY Gemfile /alert/Gemfile
COPY Gemfile.lock /alert/Gemfile.lock
RUN gem install bundler -v 2.1.4
RUN bundle install
COPY . /alert
ENV RACK_ENV production
ENV DB_HOST mysql
ENV DB_USERNAME app
ENV DB_PASSWORD app
ENV DB_NAME my_database
EXPOSE 8080

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rake", "db:create"]
CMD ["bundle", "exec", "rake", "db:migrate"]
CMD ["bundle", "exec", "rackup", "config.ru", "-o", "0.0.0.0", "-p", "8080"]
