FROM ruby:2.5.1-stretch

WORKDIR /opt/app
COPY . .

RUN bundle

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
