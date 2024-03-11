FROM maven

RUN apt-get update && apt-get -y install git

RUN git config --global --add safe.directory /tmp/build/get

CMD [ "mvn compile" ]