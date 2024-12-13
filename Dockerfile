FROM sunnykid7/gdj85jdk:17

ARG VERSION

COPY target/gdcampus-0.0.1-SNAPSHOT.war /app/gdcampus.war

LABEL maintainer="Yu Taek Kim<sunnykid7@gmail.com>" \
      title="Memberbook App" \
      version="$VERSION" \
      description="This image is memberbook service"

RUN apt-get update \
&&  TZ=Asia/Seoul \
&&  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
&&  apt-get install -y tzdata \
&&  dpkg-reconfigure --frontend noninteractive tzdata

ENV APP_HOME=/app
EXPOSE 9999
VOLUME /app/upload
WORKDIR $APP_HOME
ENTRYPOINT ["java"]
CMD ["-jar", "gdcampus.war"]
