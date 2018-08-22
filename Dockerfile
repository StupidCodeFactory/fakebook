FROM ruby:2.5.1-alpine
ENV APP_DIR /usr/local/app/
RUN mkdir -p $APP_DIR
RUN adduser -S app
RUN apk --update add --no-cache --virtual .build-deps build-base
RUN apk --update add --no-cache postgresql-dev netcat-openbsd nodejs yarn
RUN aapk update && apk add -u yarn
COPY Gemfile* $APP_DIR
WORKDIR $APP_DIR
RUN bundle install --jobs 4

COPY package.json $APP_DIR
COPY yarn.lock $APP_DIR
RUN yarn

COPY .  $APP_DIR

# RUN apk del .build-deps

RUN adduser -D -u 1000  rails_app
USER app

ENTRYPOINT [ "./run.sh" ]
CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:3000"]
