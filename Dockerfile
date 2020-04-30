# 

FROM jruby:9.2.9-jdk

ENV LOGFILE=/dev/stdout \
      RACK_ENV=production

ENV APP_ROOT /app
RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

ADD ./ ${APP_ROOT}/

RUN jruby -S gem install puma sinatra prometheus-client

CMD [ "jruby", "racktest.rb" ]
