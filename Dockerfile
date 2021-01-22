FROM golang:1.14-alpine as build
COPY ./ /go/src
WORKDIR /go/src
RUN go build -mod vendor -o sqs-autoscaler-controller

FROM scratch

COPY --from=build /go/src/sqs-autoscaler-controller /sqs-autoscaler-controller

ENTRYPOINT ["/sqs-autoscaler-controller"]