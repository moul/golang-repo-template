# build
FROM            golang:1.12-alpine as builder
RUN             apk add --no-cache git gcc musl-dev make
ENV             GO111MODULE=on
WORKDIR         /go/src/moul.io/REPLACE_ME
COPY            go.* ./
RUN             go mod download
COPY            . ./
RUN             make install

# minimalist runtime
FROM            alpine
COPY            --from=builder /go/bin/REPLACE_ME /bin/
ENTRYPOINT      ["/bin/REPLACE_ME"]
CMD             []
