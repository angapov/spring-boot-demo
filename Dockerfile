FROM maven:3-jdk-8-alpine

WORKDIR /app

COPY . /app
RUN mvn package && chgrp -R 0 /app && chmod -R g+rwX /app

ENV PORT 5000
EXPOSE $PORT
CMD [ "sh", "-c", "mvn -Dserver.port=${PORT} spring-boot:run" ]