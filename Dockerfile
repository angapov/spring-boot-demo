FROM maven:3-jdk-8-alpine

ENV APP_ROOT=/app

WORKDIR $APP_ROOT

COPY . $APP_ROOT
RUN mvn -Duser.home=$APP_ROOT package && chgrp -R 0 $APP_ROOT && chmod -R g+rwX $APP_ROOT

ENV PORT 5000
EXPOSE $PORT
CMD [ "sh", "-c", "mvn -Duser.home=$APP_ROOT -Dserver.port=$PORT spring-boot:run" ]