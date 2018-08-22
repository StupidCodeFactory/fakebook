FROM ruby:2.5.1-alpine
ENV APP_DIR /usr/local/app/
RUN mkdir -p $APP_DIR
RUN adduser -S app
RUN apk --update add --no-cache --virtual .build-deps build-base
RUN apk --update add --no-cache postgresql-dev netcat-openbsd nodejs
COPY Gemfile* $APP_DIR
WORKDIR $APP_DIR
RUN bundle install --jobs 4
COPY .  $APP_DIR
# RUN apk del .build-deps
ENTRYPOINT [ "./run.sh" ]
CMD ["bundle", "exec"]
