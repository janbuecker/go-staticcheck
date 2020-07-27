FROM golang:1.14-alpine

ENV CGO_ENABLED=0

RUN set -eux; \
	apk add --no-cache --virtual .build-deps git && \
	go get honnef.co/go/tools/cmd/staticcheck \
	&& apk del .build-deps

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

CMD ["staticcheck"]

ENTRYPOINT ["/docker-entrypoint.sh"]