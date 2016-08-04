#!/bin/sh
cd /home/gophers/go/src/golang.org/x/tour
git pull origin translate-vi
go get golang.org/x/tour/gotour
/home/gophers/go/bin/gotour
