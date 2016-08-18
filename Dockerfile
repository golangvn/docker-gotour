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

COPY local.go /home/gophers/go/src/golang.org/x/tour/gotour
RUN go install golang.org/x/tour/gotour
RUN chown -R gophers /home/gophers/go/src/golang.org/x/tour

COPY docker-entrypoint.sh /home/gophers/

ENTRYPOINT /home/gophers/docker-entrypoint.sh
USER gophers
EXPOSE 3999
