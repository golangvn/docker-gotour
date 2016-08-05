# Docker for Go Tour
[![Build Status](https://travis-ci.org/golangvn/docker-gotour.svg?branch=master)](https://travis-ci.org/golangvn/docker-gotour)

# Use
All code from golangvn/tour will be updated when gotour service is restarted.

# Use service in Core OS
- /home/core/docker-gotour This is working directory of service. Please pull code to this directory.
- Unit files are located at /etc/systemd/system/ . Please copy file gotour.service to there.
- Service commands:
```
sudo systemctl start gotour
```
- Stop service
```
sudo systemctl stop gotour
```
# How to use autodeploy
- Build that script
```
go build autodeploy.go
```
- Copy bin file to server and run it
- Add webhook with endpoint /update-docker-go-tour

# TODO
- [x] Auto restart gotour service when tour translate update
- [ ] Prevent multiple request to restart service with autodeploy.go script
- [ ] Support webhook screet
- [ ] Only update when pust to translate-vi branch
