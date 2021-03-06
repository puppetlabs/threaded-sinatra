# 

FROM jruby:9.2.9-jdk

ENV LOGFILE=/dev/stdout \
      RACK_ENV=production

ENV APP_ROOT /app
RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

ADD ./ ${APP_ROOT}/

RUN gem install bundler && bundle install
