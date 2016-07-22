FROM gliderlabs/alpine

MAINTAINER Son Bui <sonbv00@gmail.com>

RUN mkdir -p /home/gophers/go
RUN adduser -h /home/gophers -D gophers

RUN apk-install go git
ENV GOPATH /home/gophers/go

RUN go get golang.org/x/tour/gotour
RUN sed -i -e 's/127.0.0.1:3999/0.0.0.0:3999/' /home/gophers/go/src/golang.org/x/tour/gotour/local.go
RUN go install golang.org/x/tour/gotour

ENTRYPOINT /home/gophers/go/bin/gotour
USER gophers
EXPOSE 3999
