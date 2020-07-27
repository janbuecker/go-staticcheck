FROM golang:1.14-buster

RUN go get honnef.co/go/tools/cmd/staticcheck

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

CMD ["/go/bin/staticcheck"]

ENTRYPOINT ["/docker-entrypoint.sh"]