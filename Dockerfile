FROM ruby:2.4-alpine

WORKDIR /app

RUN apk --no-cache add --virtual .eventmachine-builddeps g++ make sqlite-dev build-base
RUN apk --no-cache add sqlite sqlite-libs
RUN gem install bundler --no-ri --no-rdoc

COPY Gemfile* /app/

RUN bundle install --deployment --without test development

COPY . /app

#RUN apk del .eventmachine-builddeps

CMD bin/run.sh