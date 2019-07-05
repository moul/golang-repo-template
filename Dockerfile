# build
FROM            golang:1.12-alpine as builder
RUN             apk add --no-cache git gcc musl-dev make
ENV             GO111MODULE=on
WORKDIR         /go/src/moul.io/golang-repo-template
COPY            go.* ./
RUN             go mod download
COPY            . ./
RUN             make install

# minimalist runtime
FROM            alpine
COPY            --from=builder /go/bin/golang-repo-template /bin/
ENTRYPOINT      ["/bin/golang-repo-template"]
CMD             []
