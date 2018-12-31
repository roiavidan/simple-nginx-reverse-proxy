FROM nginx:1.14.2-alpine
LABEL maintainer="Roi Avidan <roiavidan@gmail.com>"
EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]

ADD entrypoint.sh /
