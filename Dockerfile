FROM nginx:stable-alpine
LABEL maintainer="Roi Avidan <roiavidan@gmail.com>"
EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]

ADD entrypoint.sh /
