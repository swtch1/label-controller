FROM golang:1.12 AS build

COPY . /thing-controller
WORKDIR /thing-controller
RUN go build -mod=vendor -o /thingy

FROM debian:stretch-slim

COPY --from=build /thingy /usr/bin/thing-controller
