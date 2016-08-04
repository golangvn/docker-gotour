FROM gliderlabs/alpine

MAINTAINER Son Bui <sonbv00@gmail.com>

RUN mkdir -p /home/gophers/go
RUN adduser -h /home/gophers -D gophers

RUN apk-install go git
ENV GOPATH /home/gophers/go

RUN mkdir -p /home/gophers/go/src/golang.org/x/ \
    && cd /home/gophers/go/src/golang.org/x/ \
    && git clone https://github.com/golangvn/tour.git \
    && cd /home/gophers/go/src/golang.org/x/tour \
    && git checkout translate-vi \
    && go get golang.org/x/tour/gotour

RUN sed -i 's/Handshake: handshake,/Handshake: nil,/g' /home/gophers/go/src/golang.org/x/tools/playground/socket/socket.go
RUN sed -i -e "s/127.0.0.1:3999/0.0.0.0:3999/" /home/gophers/go/src/golang.org/x/tour/gotour/local.go
RUN go install golang.org/x/tour/gotour
RUN chown -R gophers /home/gophers/go/src/golang.org/x/tour

COPY docker-entrypoint.sh /home/gophers/

ENTRYPOINT /home/gophers/docker-entrypoint.sh
USER gophers
EXPOSE 3999
